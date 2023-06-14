package uk.ac.rothamsted.rdf.benchmarks;

import com.arcadedb.query.sql.executor.ResultSet;
import com.arcadedb.remote.RemoteDatabase;

import uk.ac.ebi.utils.time.XStopWatch;

/**
 * TODO: comment me!
 *
 * @author brandizi
 * <dl><dt>Date:</dt><dd>14 Jun 2023</dd></dl>
 *
 */
public class ArcadeProfiler extends AbstractProfiler
{
	private String host, dbName, dbUser, dbPasswd;
	private int port;
	
	public ArcadeProfiler ( 
		String basePath, String host, int port, String dbName, String dbUser, String dbPasswd 
	)
	{
		this ();
		this.basePath = basePath;
		this.host = host;
		this.port = port;
		this.dbName = dbName;
		this.dbUser = dbUser;
		this.dbPasswd = dbPasswd;
		this.port = port;
	}

	/**
	 * Defaults to port == {@link RemoteDatabase#DEFAULT_PORT}
	 */
	public ArcadeProfiler ( 
		String basePath, String host, String dbName, String user, String passwd 
	)
	{
		this ( basePath, host, RemoteDatabase.DEFAULT_PORT, dbName, user, passwd );
	}
	
	/**
	 * Defaults to localhost, default port and root user
	 * 
	 */
	public ArcadeProfiler ( String basePath, String dbName, String passwd )
	{
		this ( basePath, "localhost", dbName, "root", passwd );
	}

	public ArcadeProfiler ()
	{
		super ( "gremlin" );
	}

	@Override
	protected long profileQuery ( String name )
	{
		String gremlinQuery = getQueryString ( name );

		try {
			return XStopWatch.profile ( () ->
			{
				try ( RemoteDatabase database = new RemoteDatabase (
					host, port, dbName, dbUser, dbPasswd
				))
				{
					ResultSet rs = database.query ( "gremlin", gremlinQuery );
					rs.forEachRemaining ( row -> row.toJSON () );
				}
			});
		}
		catch ( Exception ex )
		{
			return -1;
		}
	}
}
