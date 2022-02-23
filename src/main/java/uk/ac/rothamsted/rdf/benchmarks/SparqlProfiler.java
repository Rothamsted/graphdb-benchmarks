package uk.ac.rothamsted.rdf.benchmarks;

import org.apache.jena.query.Query;
import org.apache.jena.query.QueryException;
import org.apache.jena.query.QueryExecution;
import org.apache.jena.query.QueryFactory;
import org.apache.jena.query.ResultSet;
import org.apache.jena.query.Syntax;
import org.apache.jena.rdfconnection.RDFConnection;
import org.apache.jena.rdfconnection.RDFConnectionFactory;

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
			this.rdfConnection = RDFConnectionFactory.connect ( endPointUrl );
		
		// Clock the query
		try
		{
			return XStopWatch.profile ( () -> 
			{
				Query query = QueryFactory.create ( sparql, Syntax.syntaxARQ );
				try ( QueryExecution qx = this.rdfConnection.query ( query ) )
				{
					ResultSet rs = qx.execSelect ();
					System.out.print(name+" "); 
					if ( rs.hasNext () ) System.out.println(rs.next ());
					else System.out.println("NOK"); 
					
				}
			});
		}
		catch ( QueryException ex ) 
		{
			log.error ( "Error while parsing {}, query is:\n{}", name, sparql );
			throw new IllegalArgumentException ( "Error while parsing SPARQL '" + name + "': " + ex.getMessage (), ex ); 
		}
	}	
}
