package uk.ac.rothamsted.rdf.benchmarks;

import org.neo4j.driver.AccessMode;
import org.neo4j.driver.AuthToken;
import org.neo4j.driver.AuthTokens;
import org.neo4j.driver.Driver;
import org.neo4j.driver.GraphDatabase;
import org.neo4j.driver.Result;
import org.neo4j.driver.Session;
import org.neo4j.driver.SessionConfig;
import org.neo4j.driver.exceptions.Neo4jException;

import uk.ac.ebi.utils.time.XStopWatch;

/**
 * Cypher profiler.
 *
 * @author brandizi
 * <dl><dt>Date:</dt><dd>15 Aug 2018</dd></dl>
 *
 */
public class CypherProfiler extends AbstractProfiler
{
	protected String login, password;
	protected Driver driver;
	
	public CypherProfiler ( String basePath, String endPointUrl, String login, String password )
	{
		this ();
		this.basePath = basePath;
		this.endPointUrl = endPointUrl;
		this.login = login;
		this.password = password;
	}

	/**
	 * Connects to "bolt://127.0.0.1:7687", "neo4j", "test".
	 */
	public CypherProfiler ( String basePath )
	{
		this ( basePath, "bolt://127.0.0.1:7687", "neo4j", "test" );
	}
	
	public CypherProfiler ()
	{
		super ( "cypher" );
	}
	
	@Override
	protected long profileQuery ( String name )
	{
		String cypher = getQueryString ( name );
					
		if ( driver == null ) {
			AuthToken auth = AuthTokens.basic ( login, password );
			this.driver = GraphDatabase.driver ( endPointUrl, auth ); 
		}
		
		SessionConfig sc = SessionConfig.builder ()
			.withDefaultAccessMode ( AccessMode.READ )
			.build ();
		
		try ( Session session = this.driver.session ( sc ); )
		{
			// Clock the query
			return XStopWatch.profile ( () -> {
				Result rs = session.run ( cypher );
				if ( rs.hasNext () ) rs.next ();					
			});
		}
		catch ( Neo4jException ex )
		{
			log.error ( "Error while parsing {}, query is:\n{}", name, cypher );
			throw new IllegalArgumentException ( "Error while parsing Cypher '" + name + "': " + ex.getMessage (), ex ); 
		}
	}

	public String getLogin ()
	{
		return login;
	}

	public void setLogin ( String login )
	{
		this.login = login;
	}

	public String getPassword ()
	{
		return password;
	}

	public void setPassword ( String password )
	{
		this.password = password;
	}	
	
}
