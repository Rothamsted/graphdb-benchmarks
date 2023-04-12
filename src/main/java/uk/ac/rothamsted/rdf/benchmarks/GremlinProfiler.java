package uk.ac.rothamsted.rdf.benchmarks;

import static java.lang.System.out;

import java.util.Iterator;
import java.util.List;
import java.util.concurrent.ExecutionException;

import org.apache.tinkerpop.gremlin.driver.Client;
import org.apache.tinkerpop.gremlin.driver.Cluster;
import org.apache.tinkerpop.gremlin.driver.MessageSerializer;
import org.apache.tinkerpop.gremlin.driver.RequestOptions;
import org.apache.tinkerpop.gremlin.driver.ser.GryoMessageSerializerV3d0;
import org.apache.tinkerpop.gremlin.structure.io.gryo.GryoMapper;
import org.janusgraph.graphdb.tinkerpop.JanusGraphIoRegistry;

import com.machinezoo.noexception.Exceptions;

import org.apache.tinkerpop.gremlin.driver.Result;

import uk.ac.ebi.utils.exceptions.ExceptionUtils;
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
public class GremlinProfiler extends AbstractProfiler
{
	/** some configuration parameters that we have found useful via experimentation */
	public static final int MIN_CONNECTION_POOL_SIZE = 2,
		MAX_CONNECTION_POOL_SIZE = 8,
		MIN_USAGES_PER_CONNECTION = 8,
		MAX_USAGES_PER_CONNECTION = 16,
		MIN_IN_PROCESS_PER_CONNECTION = 1,
		MAX_IN_PROCESS_PER_CONNECTION = 4,
		MAX_CONTENT_LENGTH = 65536000,
		MAX_WAIT_FOR_CONNECTION = 30000,
		RESULT_ITERATION_BATCH_SIZE = 64;

	/** given the problems with executions in gremlin we count the potentials timeouts */
	private int numberOfTimeouts = 0;

	private Cluster cluster;

	private Integer port;

	public GremlinProfiler ( String basePath, String endPointUrl, Integer port )
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
		
		if ( cluster == null || cluster.isClosed () || cluster.isClosing () )
		{
			// we build another cluster also if the one is already closed or is already closing
			//
			
			GryoMapper.Builder builder = GryoMapper.build ()
				.addRegistry ( JanusGraphIoRegistry.getInstance () );
			MessageSerializer serializer = new GryoMessageSerializerV3d0 ( builder );
			
			cluster = Cluster.build ( this.endPointUrl )
				.port ( this.port )
				.serializer ( serializer )
				.minConnectionPoolSize ( MIN_CONNECTION_POOL_SIZE ).maxConnectionPoolSize ( MAX_CONNECTION_POOL_SIZE )
				.minSimultaneousUsagePerConnection ( MIN_USAGES_PER_CONNECTION )
				.maxSimultaneousUsagePerConnection ( MAX_USAGES_PER_CONNECTION )
				.minInProcessPerConnection ( MIN_IN_PROCESS_PER_CONNECTION )
				.maxInProcessPerConnection ( MAX_IN_PROCESS_PER_CONNECTION ).maxContentLength ( MAX_CONTENT_LENGTH )
				.maxWaitForConnection ( MAX_WAIT_FOR_CONNECTION ).resultIterationBatchSize ( RESULT_ITERATION_BATCH_SIZE )
				.create ();
		} 

		Client client = null;
		try
		{
			client = cluster.connect ();
			final Client clientRO = client; // required in the lambda

			RequestOptions options = RequestOptions.build ()
				.timeout ( 500 )
				.create ();
			
			return XStopWatch.profile ( () -> 
			{
				try
				{
					List<Result> list = clientRO.submit ( gremlinQuery, options ).all ().get ();
					// Force fetching of the first result, just in case it's lazy
					Iterator<Result> itr = list.iterator ();
					if ( itr.hasNext () ) itr.next ();
				}
				catch ( ExecutionException ex )
				{
					// TODO: is this always a timeout? Can't it be another failure? Isn't there a specific 
					// exception?
					//
					this.numberOfTimeouts++;
					log.debug ( "timeout for Gremlin query '{}'", name );
				}
				catch ( Exception ex )
				{
					ExceptionUtils.throwEx ( 
						RuntimeException.class, ex, 
						"Error while running Gremlin query '%s': $cause, query is:\n%s\n", name, gremlinQuery
					);
				}
			});
		}
		finally
		{
			if ( client != null ) client.close (); // client does not implement auto-closeable interface
		}
	}

	public int getNumberOfTimeouts ()
	{
		return numberOfTimeouts;
	}

	public void profile ( int repeats )
	{
		super.profile ( repeats );
		out.println ( "----" );
		out.println ( "Number of timeouts: " + this.numberOfTimeouts );
	}
}
