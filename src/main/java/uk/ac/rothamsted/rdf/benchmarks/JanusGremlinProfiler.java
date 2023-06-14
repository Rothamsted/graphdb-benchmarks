package uk.ac.rothamsted.rdf.benchmarks;

import java.util.Iterator;

import org.apache.tinkerpop.gremlin.driver.Client;
import org.apache.tinkerpop.gremlin.driver.Cluster;
import org.apache.tinkerpop.gremlin.driver.RequestOptions;
import org.apache.tinkerpop.gremlin.driver.Result;

import uk.ac.ebi.utils.time.XStopWatch;

/**
 * The Gremlin profiler.
 * 
 * Important kudos to Paco Cañas and Ramón Arellano, with whom I passed quite a time playing with tinkerpop/janusgraph
 * and its configuration.
 *
 * @author cbobed
 *         <dl>
 *         <dt>Date:</dt>
 *         <dd>25 May 2021</dd>
 *         </dl>
 *
 */
public class JanusGremlinProfiler extends AbstractProfiler
{
	/** 
	 * Some configuration parameters that we have found useful via experimentation.
	 * 
	 * TODO: should become class fields, with setters and possibly getters.
	 * 
	 */
	public static final int MIN_CONNECTION_POOL_SIZE = 2,
		MAX_CONNECTION_POOL_SIZE = 8,
		MIN_USAGES_PER_CONNECTION = 8,
		MAX_USAGES_PER_CONNECTION = 16,
		MIN_IN_PROCESS_PER_CONNECTION = 1,
		MAX_IN_PROCESS_PER_CONNECTION = 4,
		MAX_CONTENT_LENGTH = 65536000,
		MAX_WAIT_FOR_CONNECTION = 30000,
		RESULT_ITERATION_BATCH_SIZE = 64;

	private int port;

	private Cluster cluster;


	public JanusGremlinProfiler ( String basePath, String host, int port )
	{
		this ();
		this.basePath = basePath;
		// As you can see, this isn't used as an URL, but as the host. Apparently, Janus 
		// doesn't accept URLs
		this.endPointUrl = host;
		this.port = port;
	}
	
	public JanusGremlinProfiler ( String basePath )
	{
		this ( basePath, "localhost", 8182 );
	}
		
	public JanusGremlinProfiler ()
	{
		super ( "gremlin" );
	}

	@Override
	protected long profileQuery ( String name )
	{
		String gremlinQuery = getQueryString ( name );
		
		if ( cluster == null || cluster.isClosed () || cluster.isClosing () )
		{
			// we build another cluster also if the one is already closed or is already closing
			//
			
			// TODO: remove? Doesn't seem to be used in recent Janus (1.0.0-rc2)
			//GryoMapper.Builder builder = GryoMapper.build ()
			//	.addRegistry ( JanusGraphIoRegistry.instance () );
			
			cluster = Cluster.build ( this.endPointUrl )
				.port ( this.port )
				.minConnectionPoolSize ( MIN_CONNECTION_POOL_SIZE ).maxConnectionPoolSize ( MAX_CONNECTION_POOL_SIZE )
				.minSimultaneousUsagePerConnection ( MIN_USAGES_PER_CONNECTION )
				.maxSimultaneousUsagePerConnection ( MAX_USAGES_PER_CONNECTION )
				.minInProcessPerConnection ( MIN_IN_PROCESS_PER_CONNECTION )
				.maxInProcessPerConnection ( MAX_IN_PROCESS_PER_CONNECTION ).maxContentLength ( MAX_CONTENT_LENGTH )
				.maxWaitForConnection ( MAX_WAIT_FOR_CONNECTION ).resultIterationBatchSize ( RESULT_ITERATION_BATCH_SIZE )
				.create ();
		} 

		try
		{
			RequestOptions options = RequestOptions.build ()
				.timeout ( 60 * 1000 )
				.create ();

			return XStopWatch.profile ( () -> 
			{
				Client client = null;
				try {
					client = cluster.connect ();
					Iterator<Result> itr = client.submit ( gremlinQuery, options ).iterator ();
					itr.forEachRemaining ( result -> result.getObject () );
				}
				finally
				{
					if ( client != null ) client.close (); // client does not implement auto-closeable interface
				}
			});
		}
		catch ( Exception ex )
		{
			// TODO: is this always a timeout? Can't it be another failure? Isn't there a specific 
			// exception?
			//
			log.error ( "Error while running {}, query is:\n{}\nError is:", name, gremlinQuery, ex );
			
			// Count it as failed
			return -1;
		}		
	}
		
}
