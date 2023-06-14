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
		var profiler = new ArcadeProfiler ( "/tmp/queries/", "biopax", "TestTest" );
		profiler.profile ( 10 );
	}
}
