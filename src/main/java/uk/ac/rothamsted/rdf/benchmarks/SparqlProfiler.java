package uk.ac.rothamsted.rdf.benchmarks;

import org.apache.jena.query.Query;
import org.apache.jena.query.QueryException;
import org.apache.jena.query.QueryExecution;
import org.apache.jena.query.QueryFactory;
import org.apache.jena.query.ResultSet;
import org.apache.jena.query.Syntax;
import org.apache.jena.rdfconnection.RDFConnection;

import uk.ac.ebi.utils.time.XStopWatch;

/**
 * The SPARQL profiler.
 *
 * @author brandizi
 * <dl><dt>Date:</dt><dd>15 Aug 2018</dd></dl>
 *
 */
public class SparqlProfiler extends AbstractProfiler
{
	protected RDFConnection rdfConnection;
	
	public SparqlProfiler ( String basePath, String endPointUrl )
	{
		this ();
		this.basePath = basePath;
		this.endPointUrl = endPointUrl;
	}

	public SparqlProfiler ()
	{
		super ( "sparql" );
	}
	
	@Override
	protected long profileQuery ( String name )
	{
		String sparql = getQueryString ( name );
					
		if ( this.rdfConnection == null )
			this.rdfConnection = RDFConnection.connect ( endPointUrl );
		
		XStopWatch watch = new XStopWatch ();
		
		// Clock the query
		try
		{
			watch.start ();
			Query query = QueryFactory.create ( sparql, Syntax.syntaxARQ );
			try ( QueryExecution qx = this.rdfConnection.query ( query ) )
			{
				// According to the most recent Jena, result streams are always consumed when reusing the 
				// connections. Because the latter is typical, we are going to consume everything, but
				// we're timing the first fetch only, as this is what we want to test and compare.
				for ( ResultSet rs = qx.execSelect (); rs.hasNext (); )
				{
					rs.next ();
					if ( watch.isStarted () ) watch.stop ();
				}
			}
			return watch.getTime ();
		}
		catch ( QueryException ex ) 
		{
			log.error ( "Error while running {}, query is:\n{}\nError is:", name, sparql, ex );
			// Count it as failed
			return -1;
		}
	}	
}
