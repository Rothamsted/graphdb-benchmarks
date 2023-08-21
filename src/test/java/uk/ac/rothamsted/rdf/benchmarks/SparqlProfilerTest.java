package uk.ac.rothamsted.rdf.benchmarks;

import org.junit.Test;

/**
 * Entry point to perform SPARQL tests.
 * 
 * TODO: we have to turn tests like this into line commands.
 * 
 * @author brandizi
 * <dl><dt>Date:</dt><dd>15 Aug 2018</dd></dl>
 *
 */
public class SparqlProfilerTest
{
	@Test
	public void testBasics ()
	{
		String sparqlUrl = "http://localhost:8890/sparql";
		//sparqlUrl = "http://knetminer-data.cyverseuk.org/lodestar/sparql";
		SparqlProfiler profiler = new SparqlProfiler ( "src/main/assembly/resources/sparql/", sparqlUrl );
		profiler.profile ( 100 );
	}
}
