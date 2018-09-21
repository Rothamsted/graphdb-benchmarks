package uk.ac.rothamsted.rdf.benchmarks;

import static java.lang.System.out;

import java.io.IOException;
import java.io.UncheckedIOException;

import uk.ac.ebi.utils.io.IOUtils;

/**
 * Lists the test queries.
 *
 * @author brandizi
 * <dl><dt>Date:</dt><dd>16 Aug 2018</dd></dl>
 *
 */
public class QueryList
{
	/**
	 * Reports a query list in Markdown format. This is used to update the main README.
	 */
	public static void listQueries ( String cypherPath, String sparqlPath, String urlPrefix )
	{
		String[] names = AbstractProfiler.getQueryNames ( sparqlPath, "sparql" );
		
		
		for ( int i = 0; i < names.length; i++ )
		{
			String name = names [ i ];
			try
			{
				String queryStr = IOUtils.readFile ( sparqlPath + name + ".sparql"  );
				String qdescr = queryStr.split ( "\n" ) [ 0 ].replace ( "# ", "" );
				
				String qid = AbstractProfiler.getQueryId ( name );
				
				out.format ( 
					"  %d. **%s**: %s, [Cypher](%s%s%7$s.cypher), [SPARQL](%4$s%6$s%7$s.sparql)\n",
					i + 1, qid, qdescr, urlPrefix, cypherPath, sparqlPath, name 	
				);
			}
			catch ( IOException ex )
			{
				String msg = String.format ( "Error while loading query for '%s': %s", name, ex.getMessage () );
				throw new UncheckedIOException ( msg, ex );
			}
		}
	}
}
