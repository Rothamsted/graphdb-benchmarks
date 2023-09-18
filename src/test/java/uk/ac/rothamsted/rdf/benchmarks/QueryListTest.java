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
	public final static String BASE_PATH = "src/main/assembly/resources/";

	@Test
	public void testBasics ()
	{
		QueryList.listQueries ( BASE_PATH, "" );
	}
	
	@Test
	public void testJsonOut ()
	{
		QueryList.listQueriesAsJsonFromBasePath ( BASE_PATH );
	}
}
