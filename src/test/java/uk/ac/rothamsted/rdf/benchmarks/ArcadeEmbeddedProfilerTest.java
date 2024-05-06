package uk.ac.rothamsted.rdf.benchmarks;

import org.junit.Test;

/**
 * Tests the embedded version of ArcadeDB (no server, same JVM)
 *
 * @author Luca Garulli (l.garulli@arcadedata.com)
 * <dl><dt>Date:</dt><dd>21 July 2023</dd></dl>
 *
 */
public class ArcadeEmbeddedProfilerTest
{
	@Test
	public void testBasics ()
	{
		var queriesPath = "src/main/assembly/resources/gremlin/";
		// DEBUG queriesPath = "/tmp/queries/";
		var profiler = new ArcadeEmbeddedProfiler ( queriesPath, "biopax");
		profiler.profile ( 10 );
	}
}
