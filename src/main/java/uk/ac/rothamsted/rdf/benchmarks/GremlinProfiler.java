package uk.ac.rothamsted.rdf.benchmarks;

import java.util.List;
import java.util.concurrent.ExecutionException;

import org.apache.jena.query.Query;
import org.apache.jena.query.QueryException;
import org.apache.jena.query.QueryExecution;
import org.apache.jena.query.QueryFactory;
import org.apache.jena.query.ResultSet;
import org.apache.jena.query.Syntax;
import org.apache.jena.rdfconnection.RDFConnection;
import org.apache.jena.rdfconnection.RDFConnectionFactory;

import org.apache.tinkerpop.gremlin.driver.Client;
import org.apache.tinkerpop.gremlin.driver.Cluster;
import org.apache.tinkerpop.gremlin.driver.MessageSerializer;
import org.apache.tinkerpop.gremlin.driver.ser.GryoMessageSerializerV3d0;
import org.apache.tinkerpop.gremlin.driver.simple.WebSocketClient;
import org.apache.tinkerpop.gremlin.structure.io.gryo.GryoMapper;
import org.janusgraph.graphdb.tinkerpop.JanusGraphIoRegistry;
import org.apache.tinkerpop.gremlin.driver.Result;




import uk.ac.ebi.utils.time.XStopWatch;

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
	public static final int MIN_CONNECTION_POOL_SIZE = 2; 
    public static final int MAX_CONNECTION_POOL_SIZE = 8; 
    public static final int MIN_USAGES_PER_CONNECTION = 8; 
    public static final int MAX_USAGES_PER_CONNECTION = 16; 
    public static final int MIN_IN_PROCESS_PER_CONNECTION = 1; 
    public static final int MAX_IN_PROCESS_PER_CONNECTION = 4; 
    public static final int MAX_CONTENT_LENGTH = 65536000; 
    public static final int MAX_WAIT_FOR_CONNECTION = 30000; 
    public static final int RESULT_ITERATION_BATCH_SIZE = 64; 
	
	protected Cluster cluster;
	protected Client client;
	
	private static GryoMapper.Builder builder = null; 
	private static MessageSerializer serializer = null; 

	protected Integer port; 
		
	public GremlinProfiler ( String basePath, String endPointUrl, Integer port)
	{
		this ();
		this.basePath = basePath; 
		this.endPointUrl = endPointUrl;
		this.port = port; 
	}

	public GremlinProfiler ()
	{
		super ( "gremlin" );
	}
	
	@Override
	protected long profileQuery ( String name )
	{
		String gremlinQuery = getQueryString ( name );
		
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
    		}
	    }
	  
		try{
			
			client = cluster.connect();  
			return XStopWatch.profile ( () -> 
			{
				
				 try {
					 List<Result> list;
			            list = client.submit(gremlinQuery).all().get();
			        } catch (Exception ex) {
			            ex.printStackTrace();
			        } 
			});
		}
		catch ( Exception ex ) 
		{
			log.error ( "Error while executing {}, query is:\n{}", name, gremlinQuery);
			throw new IllegalArgumentException ( "Error while executing Gremlin'" + name + "': " + ex.getMessage (), ex ); 
		}
		finally {
			client.close(); // client does not implement autocloseable interface
		}
	}	
}
