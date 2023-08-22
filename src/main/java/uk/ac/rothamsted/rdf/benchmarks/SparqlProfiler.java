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
		
		Query query = QueryFactory.create ( sparql, Syntax.syntaxARQ );

		try 
		{
			return XStopWatch.profile ( () -> {
				try ( QueryExecution qx = this.rdfConnection.query ( query ) )
				{
					ResultSet rs = qx.execSelect ();
					rs.forEachRemaining ( sol -> {
						// I don't know another way to be sure the result is consumed
						sol.varNames ()
						.forEachRemaining ( var -> sol.get ( var ) );
					});
				}
			});
		}
		catch ( QueryException ex ) 
		{
			log.error ( "Error while running {}", name, ex );
			// Count it as failed
			return -1;
		}
	}	
}
