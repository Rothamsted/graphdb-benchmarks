package uk.ac.rothamsted.rdf.benchmarks;

import static java.lang.System.out;

import java.io.File;
import java.io.FileFilter;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UncheckedIOException;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.filefilter.WildcardFileFilter;
import org.apache.commons.lang3.RandomUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.jena.atlas.logging.Log;
import org.apache.jena.query.Query;
import org.apache.jena.query.QueryException;
import org.apache.jena.query.QueryExecutionFactory;
import org.apache.jena.query.QueryFactory;
import org.apache.jena.query.ResultSet;
import org.apache.jena.query.Syntax;
import org.apache.jena.sparql.engine.http.QueryEngineHTTP;
import org.neo4j.driver.internal.DriverFactory;
import org.neo4j.driver.v1.AccessMode;
import org.neo4j.driver.v1.AuthToken;
import org.neo4j.driver.v1.AuthTokens;
import org.neo4j.driver.v1.Driver;
import org.neo4j.driver.v1.GraphDatabase;
import org.neo4j.driver.v1.Session;
import org.neo4j.driver.v1.StatementResult;
import org.neo4j.driver.v1.exceptions.Neo4jException;

import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;
import com.google.common.cache.CacheLoader;
import com.google.common.cache.LoadingCache;
import com.opencsv.CSVReaderBuilder;
import com.opencsv.CSVReaderHeaderAware;

import uk.ac.ebi.utils.io.IOUtils;
import uk.ac.ebi.utils.time.XStopWatch;

/**
 * TODO: comment me!
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
		
		try ( Session session = this.driver.session ( AccessMode.READ ); )
		{
			// Clock the query
			return XStopWatch.profile ( () -> {
				StatementResult rs = session.run ( cypher );
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
