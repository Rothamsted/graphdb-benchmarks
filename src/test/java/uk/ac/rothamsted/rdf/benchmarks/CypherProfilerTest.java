package uk.ac.rothamsted.rdf.benchmarks;

import org.junit.Test;

/**
 * TODO: comment me!
 *
 * @author brandizi
 * <dl><dt>Date:</dt><dd>15 Aug 2018</dd></dl>
 *
 */
public class CypherProfilerTest
{
	@Test
	public void testBasics ()
	{
		CypherProfiler profiler = new CypherProfiler ( "src/main/assembly/resources/cypher/" );
		profiler.profile ( 2100 );
	}
}
