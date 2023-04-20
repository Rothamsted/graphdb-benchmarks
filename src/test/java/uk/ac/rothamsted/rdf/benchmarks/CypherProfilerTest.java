package uk.ac.rothamsted.rdf.benchmarks;

import org.junit.Test;

/**
 * Entry point to perform Cypher tests.
 * 
 * TODO: we have to turn tests like this into line commands.
 * 
 * @author brandizi
 * <dl><dt>Date:</dt><dd>15 Aug 2018</dd></dl>
 *
 */
public class CypherProfilerTest
{
	/**
	 * Reports a query list in Markdown format. This is used to update the main README.
	 */	
	@Test
	public void testBasics ()
	{
		CypherProfiler profiler = new CypherProfiler ( "src/main/assembly/resources/cypher/" );
		profiler.profile ( 10 );
	}
}
