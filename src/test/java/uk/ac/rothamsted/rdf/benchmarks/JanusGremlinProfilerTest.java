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
public class JanusGremlinProfilerTest
{
	@Test
	public void testBasics ()
	{
		JanusGremlinProfiler profiler = new JanusGremlinProfiler( 
			"src/main/assembly/resources/gremlin/"
			// "/tmp/gremlin/"
		);
		profiler.profile ( 10 );
	}
}
