package uk.ac.rothamsted.rdf.benchmarks.utils;

import java.text.MessageFormat;

import org.apache.commons.lang3.StringUtils;
import org.junit.Rule;
import org.junit.rules.ExternalResource;
import org.junit.rules.TestRule;
import org.junit.runner.Description;
import org.junit.runner.notification.RunListener;
import org.junit.runners.model.Statement;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * # An output decorator for JUnit
 *
 * Logs a nice header with the test name before the test and a similar trailer 
 * afterward.  
 * 
 * This can be used in two ways. One is as a {@link TestRule}, pretty much the same way you would use 
 * {@link ExternalResource}. Another option is to add this listener to your runner of choice in order to be invoked 
 * automatically for all the tests run via that runner.  
 * 
 * For instance, see
 * [here](http://maven.apache.org/plugins/maven-surefire-plugin/examples/junit.html#Using_custom_listeners_and_reporters)
 * for what concerns Maven/Surefire. The JUtils's POM is itself another example of that.  
 * 
 * **WARNING**: this uses SLF4J, you need to enable the INFO level to see anything.  
 * 
 * <dl><dt>date</dt><dd>Jan 27, 2012</dd></dl>
 * @author brandizi
 *
 */
public class TestOutputDecorator extends RunListener implements TestRule 
{
	private Logger log = LoggerFactory.getLogger ( this.getClass () );
	
	@Override
	public void testStarted ( Description description ) throws Exception
	{
		String label = MessageFormat.format ( " {0} ", description.getDisplayName () );
		log.info ( "     " + StringUtils.center ( label, 110, "=-" ) );
	}

	@Override
	public void testFinished ( Description description ) throws Exception
	{
		String label = MessageFormat.format ( " /end: {0} ", description.getDisplayName () );
		log.info ( "    " + StringUtils.center ( label, 110, "=-" ) + "\n" );
	}

	/**
	 * You can use this class either as a listener, or a {@link Rule}, so we have this method too, to be called by
	 * JUnit in the second case.
	 */
	@Override
	public Statement apply ( final Statement base, final Description description )
	{
		return new Statement() {
			@Override
			public void evaluate() throws Throwable {
				testStarted ( description );
				try {
					base.evaluate();
				} finally {
					testFinished ( description );
				}
			}
		};	
	}

}
