package uk.ac.rothamsted.rdf.benchmarks;
import org.junit.Test;

/**
 * Entry point to perform Gremlin/Janusgraph tests.
 * import org.apache.tinkerpop.gremlin.driver.Result;

 * TODO: we have to turn tests like this into line commands.
 * 
 * @author cbobed
 * <dl><dt>Date:</dt><dd>25 May 2021</dd></dl>
 *
 */
public class GremlinProfilerTest
{
	@Test
	public void testBasics ()
	{
		// TODO: use the logger! 
		System.out.println("Creating ..."); 
		GremlinProfiler profiler = new GremlinProfiler( "src/main/assembly/resources/gremlin/", "localhost", 8182);
		System.out.println("Profiler created ..."); 
		profiler.profile ( 1000 );
		
	}
}
