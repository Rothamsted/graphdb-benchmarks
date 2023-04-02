package uk.ac.rothamsted.rdf.benchmarks;

import static java.lang.System.out;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;

import org.apache.commons.lang3.RandomUtils;
import org.apache.tinkerpop.gremlin.driver.Client;
import org.apache.tinkerpop.gremlin.driver.Cluster;
import org.apache.tinkerpop.gremlin.driver.MessageSerializer;
import org.apache.tinkerpop.gremlin.driver.RequestOptions;
import org.apache.tinkerpop.gremlin.driver.ser.GryoMessageSerializerV3d0;
import org.apache.tinkerpop.gremlin.driver.simple.WebSocketClient;
import org.apache.tinkerpop.gremlin.structure.io.gryo.GryoMapper;
import org.janusgraph.graphdb.tinkerpop.JanusGraphIoRegistry;

import com.fasterxml.jackson.annotation.JacksonInject.Value;

import org.apache.tinkerpop.gremlin.driver.Result;
import org.apache.tinkerpop.gremlin.driver.ResultSet;

import uk.ac.rothamsted.rdf.benchmarks.utils.XStopWatch;


/**
 * The Gremlin profiler. 
 * 
 * Important kudos to Paco Cañas and Ramón Arellano, with whom I passed quite a time playing with tinkerpop/janusgraph and 
 * its configuration. 
 *
 * @author cbobed
 * <dl><dt>Date:</dt><dd>25 May 2021</dd></dl>
 *
 */
public class GremlinProfiler extends AbstractProfiler
{
	
	/* some configuration parameters that we have found useful via experimentation */ 
	public static final int MIN_CONNECTION_POOL_SIZE = 4; 
    public static final int MAX_CONNECTION_POOL_SIZE = 8; 
    public static final int MIN_USAGES_PER_CONNECTION = 16; 
    public static final int MAX_USAGES_PER_CONNECTION = 32; 
    public static final int MIN_IN_PROCESS_PER_CONNECTION = 1; 
    public static final int MAX_IN_PROCESS_PER_CONNECTION = 4; 
    public static final int MAX_CONTENT_LENGTH = 65536000; 
    public static final int MAX_WAIT_FOR_CONNECTION = 30000; 
    public static final int RESULT_ITERATION_BATCH_SIZE = 256; 

    /* max timeout in ms */ 
    
    public static final int QUERY_TIMEOUT = 120000; 
    
    /* given the problems with executions in gremlin we count the potentials timeouts storing the
     * culprit*/
    
    protected Hashtable<String, Integer> timeouts = null; 
    
	protected static Cluster cluster;
	protected static Client client;
	
	private static GryoMapper.Builder builder = null; 
	private static MessageSerializer serializer = null; 

	protected Integer port; 
		
	public GremlinProfiler ( String basePath, String endPointUrl, Integer port)
	{
		this ();
		this.basePath = basePath; 
		this.endPointUrl = endPointUrl;
		this.port = port; 
		this.timeouts = new Hashtable<>(); 
		
		
		builder = GryoMapper.build().addRegistry(JanusGraphIoRegistry.getInstance());
	    serializer = new GryoMessageSerializerV3d0(builder);
	    if (cluster == null) { 
	    	// we build another cluster also if the one is already closed or is already closing
	    	cluster = Cluster.build(this.endPointUrl).port(this.port)
                .serializer(serializer)
                .minConnectionPoolSize(MIN_CONNECTION_POOL_SIZE)
                .maxConnectionPoolSize(MAX_CONNECTION_POOL_SIZE)
                .minSimultaneousUsagePerConnection(MIN_USAGES_PER_CONNECTION)
                .maxSimultaneousUsagePerConnection(MAX_USAGES_PER_CONNECTION)
                .minInProcessPerConnection(MIN_IN_PROCESS_PER_CONNECTION)
                .maxInProcessPerConnection(MAX_IN_PROCESS_PER_CONNECTION)
                .maxContentLength(MAX_CONTENT_LENGTH)
                .maxWaitForConnection(MAX_WAIT_FOR_CONNECTION)
                .resultIterationBatchSize(RESULT_ITERATION_BATCH_SIZE).create();
	    	client = cluster.connect(); 
	    }
	    else {
	    	if  (cluster.isClosed() || cluster.isClosing() ) { 
	 
	    	// we build another cluster also if the one is already closed or is already closing
	    	cluster = Cluster.build(this.endPointUrl).port(this.port)
                .serializer(serializer)
                .minConnectionPoolSize(MIN_CONNECTION_POOL_SIZE)
                .maxConnectionPoolSize(MAX_CONNECTION_POOL_SIZE)
                .minSimultaneousUsagePerConnection(MIN_USAGES_PER_CONNECTION)
                .maxSimultaneousUsagePerConnection(MAX_USAGES_PER_CONNECTION)
                .minInProcessPerConnection(MIN_IN_PROCESS_PER_CONNECTION)
                .maxInProcessPerConnection(MAX_IN_PROCESS_PER_CONNECTION)
                .maxContentLength(MAX_CONTENT_LENGTH)
                .maxWaitForConnection(MAX_WAIT_FOR_CONNECTION)
                .resultIterationBatchSize(RESULT_ITERATION_BATCH_SIZE).create();
	    		client = cluster.connect(); 
    		}
	    }
		
	}

	public GremlinProfiler ()
	{
		super ( "gremlin" );
	}
	
	@Override
	protected long profileQuery ( String name )
	{
		String gremlinQuery = getQueryString ( name );
		
		try{
			
			return XStopWatch.profile ( () -> 
			{
				
				 try {
					 
					 	//log.info("Query: "+gremlinQuery); 
						 // this is the setup
						 RequestOptions options = RequestOptions.build().timeout(QUERY_TIMEOUT).create();
						 //System.err.println("posed ... "); 
						 
						 // get is blocking ... moreover, under the submit, you have a get operation. 
						 // List<Result> list = client.submit(gremlinQuery, options).all().get();
						 Result r = client.submit(gremlinQuery, options).one(); 
						 //System.err.println("returned ... ");
						 
//						 if (r != null) {
//							log.info(r.toString()); 
//						 }
//						 else {
//							 log.info("Returning null ... NOK"); 
//						 }
			        } 
				 	catch (RuntimeException ex) {
				 		log.debug("Probably timeout");
				 		if (!timeouts.containsKey(name)) {
				 			timeouts.put(name, 0); 
				 		}
				 		// no concurrent access is done
				 		timeouts.put(name, timeouts.get(name)+1); 
				 	}
				 	catch (Exception ex) {
			            ex.printStackTrace();
			        }
			});
			
		}
		catch ( Exception ex ) 
		{
			log.error ( "Error while executing {}, query is:\n{}", name, gremlinQuery);
			throw new IllegalArgumentException ( "Error while executing Gremlin'" + name + "': " + ex.getMessage (), ex ); 
		}
		
	}

	public Hashtable <String, Integer> getTimeouts() {
		return timeouts;
	}	
	
	public void profile ( int repeats )
	{
		int totalTimeouts = 0; 
		// we could use 
		// super.profileForcingExecutions(repeats);
		// to throw the queries in a different way (forcing the execution of all of them) 
		super.profile(repeats);
		out.println("----"); 
		out.println("Timeout Report"); 
		out.println("----"); 
		if (this.timeouts.isEmpty()) {
			out.println("No timeouts"); 
		}
		else {
			for (String name: this.timeouts.keySet()) {
				out.println(name+" : "+this.timeouts.get(name));
				totalTimeouts += this.timeouts.get(name); 
			}
			System.out.println("Total number of timeouts: "+ totalTimeouts); 
		}
		
		((GremlinProfiler)this).closeEverything(); 
	}	
	
	public void closeEverything() {
		if (client != null) client.close(); 
		if (cluster != null) cluster.close(); 
	}
}
