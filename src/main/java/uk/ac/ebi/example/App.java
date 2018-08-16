package uk.ac.ebi.example;

import static java.lang.System.out;

import java.io.PrintWriter;

import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.CommandLineParser;
import org.apache.commons.cli.DefaultParser;
import org.apache.commons.cli.HelpFormatter;
import org.apache.commons.cli.Option;
import org.apache.commons.cli.Options;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * A skeleton for a typical Command Line entry point.
 * 
 */
public class App
{
	/**
	 * If you set this to true, main() will not invoke {@link System#exit(int)}. This is useful in unit tests.
	 */
	public static final String NO_EXIT_PROP = "uk.ac.ebi.debug.no_jvm_exit"; 
			
	private static int exitCode = 0;
	
	private static Logger log = LoggerFactory.getLogger ( App.class );

	
	
	public static void main ( String... args )
	{
		try
		{
			exitCode = 0;
			CommandLineParser clparser = new DefaultParser ();
			CommandLine cli = clparser.parse ( getOptions(), args );
			
			if ( cli.hasOption ( "help" ) ) 
			{
				printUsage ();
				return;
			}
			
			out.println ( "Hello World! These are the arguments you sent me:" );
			for ( String arg: args ) out.print ( arg + "\t" );
			out.println ();

			out.println ( "And you're left with these after having eaten options:" );
			args = cli.getArgs ();
			for ( String arg: args ) out.print ( arg + "\t" );
			out.println ();
			
			log.info ( "all went fine!" );
		}
		catch ( Throwable ex ) 
		{
			log.error ( "Execution failed with the error: " + ex.getMessage (), ex  );
			exitCode = 1; // TODO: proper exit codes
		}
		finally 
		{
			if ( !"true".equals ( System.getProperty ( NO_EXIT_PROP ) ) )
				System.exit ( exitCode );
		}
	}
	
	private static Options getOptions ()
	{
		Options opts = new Options ();

		opts.addOption ( Option.builder ( "h" )
			.desc ( "Prints out this message" )
			.longOpt ( "help" )
			.build ()
		);
		
		return opts;		
	}
	
	private static void printUsage ()
	{
		out.println ();

		out.println ( "\n\n *** Command Line Example ***" );
		out.println ( "\nDoes nothing, it's just a skeleton app! :-)" );
		
		out.println ( "\nSyntax:" );
		out.println ( "\n\trun.sh [options] [params]" );		
		
		out.println ( "\nOptions:" );
		HelpFormatter helpFormatter = new HelpFormatter ();
		PrintWriter pw = new PrintWriter ( out, true );
		helpFormatter.printOptions ( pw, 100, getOptions (), 2, 4 );
		
		out.println ( "\nStart from this code to make your CLI\n\n" );
		
		exitCode = 1;
	}

	/**
	 * This can be used when {@link #NO_EXIT_PROP} is "true" and you're invoking the main() method from 
	 * a JUnit test. It tells you the OS exit code that the JVM would return upon exit.
	 */
	public static int getExitCode () {
		return exitCode;
	}

}
