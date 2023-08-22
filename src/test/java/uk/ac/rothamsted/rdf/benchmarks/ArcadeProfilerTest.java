package uk.ac.rothamsted.rdf.benchmarks;

import org.junit.Test;

/**
 * TODO: comment me!
 *
 * @author brandizi
 * <dl><dt>Date:</dt><dd>14 Jun 2023</dd></dl>
 *
 */
public class ArcadeProfilerTest
{
	@Test
	public void testBasics ()
	{
		var queriesPath = "src/main/assembly/resources/gremlin/";
		// DEBUG queriesPath = "/tmp/queries/";
		// NOTE: don't store multiple DB in the same server instance, we do not know if this affects performance.
		var profiler = new ArcadeProfiler ( queriesPath, "rdf2pgbench", "testTest" );
		//profiler.profile ( 10 );
		profiler.profile ();
	}
}
