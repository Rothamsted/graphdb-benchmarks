package uk.ac.rothamsted.rdf.benchmarks;

import java.util.regex.Pattern;

import org.junit.Test;

/**
 * TODO: comment me!
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
		QueryList.listQueries ( basePath + "cypher/", basePath + "sparql/", "../" );
	}
}
