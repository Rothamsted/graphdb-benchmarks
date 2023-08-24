package uk.ac.rothamsted.rdf.benchmarks;

import static java.lang.System.out;

import java.io.File;
import java.io.FileFilter;
import java.io.FileReader;
import java.io.IOException;
import java.io.UncheckedIOException;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.filefilter.WildcardFileFilter;
import org.apache.commons.lang3.RandomUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.math3.stat.descriptive.SummaryStatistics;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.opencsv.CSVParser;
import com.opencsv.CSVParserBuilder;
import com.opencsv.CSVReader;
import com.opencsv.CSVReaderBuilder;

import uk.ac.ebi.utils.exceptions.ExceptionUtils;
import uk.ac.ebi.utils.opt.io.IOUtils;
import uk.ac.ebi.utils.runcontrol.ProgressLogger;

/**
 * Abstract class to drive the a benchmark test with Cypher or SPARQL queries.
 *
 * @author brandizi
 * <dl><dt>Date:</dt><dd>15 Aug 2018</dd></dl>
 *
 */
public abstract class AbstractProfiler
{
	protected String basePath;
	protected final String queryFileExtension;
	
	protected Logger log = LoggerFactory.getLogger ( this.getClass () );
	
	protected String endPointUrl;
	

	protected AbstractProfiler ( String queryFileExtension )
	{
		super ();
		this.queryFileExtension = queryFileExtension;
	}

	/** 
	 * Defaults to 120 repetitions.
	 * 
	 */
	public void profile ()
	{
		profile ( 120 );
	}

	/**
	 * The general profiling procedure, see the main README. 
	 */
	public void profile ( int repeatsPerQuery )
	{
		log.info ( 
			"Start profiling with {} and {} repeats/query",
			this.getClass ().getSimpleName (), repeatsPerQuery
		); 
		
		// all the tests/queries
		String names[] = getQueryNames ( this.basePath, this.queryFileExtension );
				
		// Do a number of iterations and collect per-query results
		// See the Apache Commons documentation about this class:
		// https://commons.apache.org/proper/commons-math/userguide/stat.html
		SummaryStatistics[] stats = new SummaryStatistics [ names.length ];
		Integer timeoutCounts[] = new Integer [ names.length ];
		
		ProgressLogger progressLogger = new ProgressLogger ( "{} query executions profiled", 100 );
		progressLogger.setIsThreadSafe ( true );
		
		final int totalRepeats = repeatsPerQuery * names.length;
		for ( int rep = 0; rep < totalRepeats; rep++ )
		{
			// pick up a random query to run
			int iq = RandomUtils.nextInt ( 0, names.length );
			String qname = names [ iq ];
			
			try 
			{
				long time = profileQuery ( qname );
				
				if ( time == -1 )
				{
					log.warn ( "Timeout/error for query {}", qname );
					if ( timeoutCounts [ iq ] == null )
						timeoutCounts [ iq ] = 1;
					else
						timeoutCounts [ iq ]++;
				}
				else
				{
					if ( stats [ iq ] == null ) stats [ iq ] = new SummaryStatistics ();
					stats [ iq ].addValue ( time );
				}
				
				progressLogger.update ( rep );
			}
			catch ( Exception ex ) {
				ExceptionUtils.throwEx ( RuntimeException.class, ex, 
					"Error while running the query: %s: $cause", qname
				);
			}
		}
		
		// And finally report everything
		writeStats ( names, stats, timeoutCounts );
		
		log.info ( "Benchmark finished" );
	}	
	
	/*
	 * TODO: this is a variant that tries to ensure every query is executed at least once. However, 
	 * 1. looks like it's not used
	 * 2. it only ensures each query is run at least once, but doesn't ensure any balance in runs/query
	 * 3. if there are enough repeats wrt the no of queries (thousands), then it's the large numbers law
	 *    that ensures an even distribution
	 * 4. if we really need each query is ran exactly repeatsPerQuery times, a better method is:
	 *    for repeat in 1 .. repeatsPerQuery:
	 *      for query in shuffle(queries): // shuffle the queries array randomly
	 *        profile ( query ) and collect
	 *  
	 * In conclusion, either delete this, or re-arrange it as above.
	 */
//	public void profileForcingExecutions ( int repeatsPerQuery )
//	{
//		log.info("Start profiling ..."); 
//
//		// all the tests
//		String names[] = getQueryNames ( this.basePath, this.queryFileExtension );
//				
//		// Do a number of iterations
//		int counts [] = new int [ names.length ];
//		ArrayList<Double>[] times = new ArrayList[ names.length ];
//		ArrayList<Integer> availableQueries = new ArrayList<Integer>(); 
//		
//		for (int i=0; i<names.length;i++) {
//			availableQueries.add(i); 
//		}
//		
//		for ( int rep = 0; rep < repeatsPerQuery*names.length; rep++ )
//		{
//			// pick up a random query from the available ones
//			int availableQueryPosition = RandomUtils.nextInt ( 0, availableQueries.size()); 
//			int queryPosition = availableQueries.get(availableQueryPosition);
//			log.info("QueryName: "+names[queryPosition]); 
//			counts [ queryPosition ]++;
//			if (times[queryPosition] == null) {
//				times[queryPosition] = new ArrayList<Double>(); 
//			}
//			times [ queryPosition ].add( Double.valueOf(profileQuery ( names [ queryPosition ] ) ) );
//			
//			if (counts[queryPosition] == repeatsPerQuery) {
//				// I remove it from the available ones
//				availableQueries.remove(availableQueryPosition); 
//			}
//			
//			if ( rep > 0 && rep % 50 == 0) log.info ( "{} runs", rep );
//		}
//		
//		writeStats(names, times); 
//	}	

	
	
	protected void writeStats ( String queryNames[], SummaryStatistics[] stats, Integer[] timeoutCounts )
	{
		out.println ( "Name\tAvgTime\tSTD\tMinTime\tMaxTime\tExecs\tTimeouts" );
		for ( int i = 0; i < queryNames.length; i++ )
		{	
			out.printf ( "%s", getQueryId ( queryNames[ i ] ) );

			SummaryStatistics statsi = stats [ i ];

			if ( statsi == null )
				out.printf ( "\t-\t-\t-\t-\t-" );
			else
				out.printf ( 
					"\t%f\t%f\t%f\t%f\t%d",
					statsi.getMean (),
					statsi.getStandardDeviation (),
					statsi.getMin (),
					statsi.getMax (),
					statsi.getN ()
				);

			out.printf ( "\t%d\n", timeoutCounts [ i ] == null ? 0 : timeoutCounts [ i ] );
		}
	}	
	
	
	
	
	/**
	 * Should use {@link #getQueryString(String)}, issue the query and get the required time.
	 * 
	 * You should time the query from when you send the string to the server to when you get results back
	 * It's OK to keep an HTTP connection pool, but you should reset the client session every time.
	 * 
	 * It should return -1 when it fails for timeout or other reason.
	 * 
	 * To be fair, you should clock the fetch of all results, since some driver might do that
	 * lazily and some others might not. Number of results should be limited by the queries.
	 * 
	 */
	protected abstract long profileQuery ( String name );

	
	/**
	 * Reads parameters from a table like basePath + name.csv.
	 */
	protected List<String[]> readParams ( String name )
	{
		File csvf = new File ( basePath + name + ".csv" );
		if ( !csvf.exists () ) return null;
		
		CSVParser csvParser = new CSVParserBuilder ()
			.withSeparator ( '\t' )
			.withQuoteChar ( '"' )
			.withEscapeChar ( '\0' )
			.build ();
		
		try ( CSVReader rdr = new CSVReaderBuilder ( new FileReader ( csvf ) )
																.withCSVParser ( csvParser )
																.build ();
		) 
		{
		 return rdr.readAll ();
		}
		catch ( IOException ex ) {
			String msg = String.format ( "Error while loading paramters for '%s': %s", name, ex.getMessage () );
			throw new UncheckedIOException ( msg, ex );
		}
	}

	
	
	/**
	 * Injects params into str, looking for $colName placeholders.
	 */
	protected String getQueryString ( String name )
	{
		try
		{
			String queryStr = IOUtils.readFile ( basePath + name + "." + this.queryFileExtension );

			List<String[]> params = readParams ( name );
			if ( params == null ) return queryStr;
			
			String[] headers = params.get ( 0 );
			for ( int j = 0; j < headers.length; j++ )
				headers [ j ] = "$" + headers [ j ];
			
			int i = RandomUtils.nextInt ( 1, params.size () );
			String[] row = params.get ( i );
			
			return StringUtils.replaceEach ( queryStr, headers, row );
		}
		catch ( UncheckedIOException ex )
		{
			String msg = String.format ( "Error while loading query for '%s': %s", name, ex.getMessage () );
			throw new RuntimeException ( msg, ex );
		}
	}
	
	/**
	 * Lists all the file names in basePath and extract the base names from them (i.e.m without any path or extension). 
	 */
	public static String[] getQueryNames ( String basePath, String queryFileExtension )
	{
		File dir = new File ( basePath );
		File sparqlFiles [] = dir.listFiles ( (FileFilter) new WildcardFileFilter ( "*." + queryFileExtension ) );
		
		return Arrays.asList ( sparqlFiles )
		.stream ()
		.map ( f -> FilenameUtils.getBaseName ( f.getName () ) )
		.sorted ()
		.collect ( Collectors.toList () )
		.toArray ( new String [ 0 ] );
	}
	
	/**
	 * Gets a query ID, ie, {@code NNNN_id => id}
	 */
	public static String getQueryId ( String name )
	{
		return name.replaceFirst ( "^[0-9]+_", "" );
	}
	
	
	public String getBasePath ()
	{
		return basePath;
	}

	public void setBasePath ( String basePath )
	{
		this.basePath = basePath;
	}


	public String getEndPointUrl ()
	{
		return endPointUrl;
	}


	public void setEndPointUrl ( String endPointUrl )
	{
		this.endPointUrl = endPointUrl;
	}
}