package uk.ac.rothamsted.rdf.benchmarks;

import org.junit.Test;

/**
 * Entry point to spawn a query list for the documentation.
 * 
 * TODO: we have to turn tests like this into line commands.
 * 
 * @author brandizi
 * <dl><dt>Date:</dt><dd>16 Aug 2018</dd></dl>
 *
 */
public class QueryListTest
{
	@Test
	public void testBasics ()
	{
		String basePath = "src/main/assembly/resources/";
		QueryList.listQueries ( basePath + "cypher/", basePath + "sparql/", "" );
	}
}
