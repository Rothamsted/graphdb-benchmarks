package uk.ac.rothamsted.rdf.benchmarks;

import org.junit.Test;

/**
 * TODO: comment me!
 *
 * @author Marco Brandizi
 * <dl><dt>Date:</dt><dd>6 May 2024</dd></dl>
 *
 */
public class ArcadeProfilerSqlTest
{
	@Test
	public void testBasics ()
	{
		var queriesPath = "src/main/assembly/resources/arcadedb-sql/";
		// DEBUG queriesPath = "/tmp/queries/";
		// NOTE: don't store multiple DBs in the same server instance, we do not know if this affects performance.
		var profiler = new ArcadeProfiler ( queriesPath, "biopax", "playwithdata" );
		profiler.profile ();
	}
}
