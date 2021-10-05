package uk.ac.rothamsted.rdf.benchmarks;

import static java.lang.System.out;

import java.util.List;
import java.util.concurrent.ExecutionException;

import org.apache.tinkerpop.gremlin.driver.Client;
import org.apache.tinkerpop.gremlin.driver.Cluster;
import org.apache.tinkerpop.gremlin.driver.MessageSerializer;
import org.apache.tinkerpop.gremlin.driver.RequestOptions;
import org.apache.tinkerpop.gremlin.driver.ser.GryoMessageSerializerV3d0;
import org.apache.tinkerpop.gremlin.driver.simple.WebSocketClient;
import org.apache.tinkerpop.gremlin.structure.io.gryo.GryoMapper;
import org.janusgraph.graphdb.tinkerpop.JanusGraphIoRegistry;
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

    /* given the problems with executions in gremlin we count the potentials timeouts*/ 
    protected int numberOfTimeouts = 0; 
    
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
					 
					 	log.info("Query: "+gremlinQuery); 
						 // this is the setup
						 RequestOptions options = RequestOptions.build().timeout(60000).create();
						 List<Result> list = client.submitAsync(gremlinQuery, options).get().all().getNow(null);
						 //ResultSet set = client.submit(gremlinQuery,options); 
						 //while (!set.allItemsAvailable()) {}
						 //for (Result l: set) {
						 //}
			        } 
				 	catch (ExecutionException ex) {
				 		log.debug("Probably timeout");
						this.numberOfTimeouts ++; 
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



	public int getNumberOfTimeouts() {
		return numberOfTimeouts;
	}	
	
	public void profile ( int repeats )
	{
		super.profile(repeats); 
		out.println("----"); 
		out.println("Number of timeouts: "+this.numberOfTimeouts); 
	}	
	
	public void closeEverything() {
		if (client != null) client.close(); 
		if (cluster != null) cluster.close(); 
	}
}
