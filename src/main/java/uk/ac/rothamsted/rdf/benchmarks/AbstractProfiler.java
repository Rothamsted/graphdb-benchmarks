package uk.ac.rothamsted.rdf.benchmarks;

import static java.lang.System.out;

import java.io.File;
import java.io.FileFilter;
import java.io.FileReader;
import java.io.IOException;
import java.io.UncheckedIOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.stream.Collectors;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.filefilter.WildcardFileFilter;
import org.apache.commons.lang3.RandomUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.opencsv.CSVParser;
import com.opencsv.CSVParserBuilder;
import com.opencsv.CSVReader;
import com.opencsv.CSVReaderBuilder;

import uk.ac.rothamsted.rdf.benchmarks.utils.IOUtils;

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
	 * The general profiling procedure, see the main README. 
	 */
	public void profile ( int repeats )
	{
		

		log.info("Start profiling ..."); 

		// all the tests
		String names[] = getQueryNames ( this.basePath, this.queryFileExtension );
				
		// Do a number of iterations
		int counts [] = new int [ names.length ];
		ArrayList<Double>[] times = new ArrayList[ names.length ];
		
		for ( int rep = 0; rep < repeats; rep++ )
		{
			
			// pick up a random query
			int i = RandomUtils.nextInt ( 0, names.length );
			log.info("QueryName: "+names[i]); 
			counts [ i ]++;
			if (times[i] == null) {
				times[i] = new ArrayList<Double>(); 
			}
			times [ i ].add( Double.valueOf(profileQuery ( names [ i ] ) ) );
			
			if ( rep > 0 && rep % 50 == 0) log.info ( "{} runs", rep );
		}
		
		writeStats(names, times); 
	}	
	
	public void profileForcingExecutions ( int repeatsPerQuery)
	{
		

		log.info("Start profiling ..."); 

		// all the tests
		String names[] = getQueryNames ( this.basePath, this.queryFileExtension );
				
		// Do a number of iterations
		int counts [] = new int [ names.length ];
		ArrayList<Double>[] times = new ArrayList[ names.length ];
		ArrayList<Integer> availableQueries = new ArrayList<Integer>(); 
		
		for (int i=0; i<names.length;i++) {
			availableQueries.add(i); 
		}
		
		for ( int rep = 0; rep < repeatsPerQuery*names.length; rep++ )
		{
			// pick up a random query from the available ones
			int availableQueryPosition = RandomUtils.nextInt ( 0, availableQueries.size()); 
			int queryPosition = availableQueries.get(availableQueryPosition);
			log.info("QueryName: "+names[queryPosition]); 
			counts [ queryPosition ]++;
			if (times[queryPosition] == null) {
				times[queryPosition] = new ArrayList<Double>(); 
			}
			times [ queryPosition ].add( Double.valueOf(profileQuery ( names [ queryPosition ] ) ) );
			
			if (counts[queryPosition] == repeatsPerQuery) {
				// I remove it from the available ones
				availableQueries.remove(availableQueryPosition); 
			}
			
			if ( rep > 0 && rep % 50 == 0) log.info ( "{} runs", rep );
		}
		
		writeStats(names, times); 
	}	
	
	protected void writeStats (String names[], ArrayList<Double>[] times) {
		// And finally, compute the average times and report
		out.println ("Name\tAvgTime\tSTD\tMaxTime\tMinTime\tExecs");
		double mean; 
		double std; 
		double min; 
		double max; 
		for ( int i = 0; i < names.length; i++  ) {
			mean = times[i].stream().mapToDouble(d->d).average().orElse(0.0);
			std = stdeviation(times[i], mean); 
			max = times[i].stream().mapToDouble(d->d).max().orElse(0.0); 
			min = times[i].stream().mapToDouble(d->d).min().orElse(0.0); 
			out.printf ( "%s\t%f\t%f\t%f\t%f\t%d\n", getQueryId ( names [ i ] ), mean, std, max, min, times[i].size() );
		}
	}
	
	
	protected Double stdeviation(ArrayList<Double> v, double mean) {
		return v.stream()
				.mapToDouble(d->d)
				.map(x -> x - mean)
				.map(x -> x * x).sum() / v.size();
	}
	
	
	/**
	 * Should use {@link #getQueryString(String)}, issue the query and get the required time.
	 * You should time the query from when you send the string to the server to when you get results back
	 * It's OK to keep an HTTP connection pool, but you should reset the client session every time.
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
		catch ( IOException ex )
		{
			String msg = String.format ( "Error while loading query for '%s': %s", name, ex.getMessage () );
			throw new UncheckedIOException ( msg, ex );
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