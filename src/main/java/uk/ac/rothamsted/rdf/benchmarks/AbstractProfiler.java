package uk.ac.rothamsted.rdf.benchmarks;

import static java.lang.System.out;

import java.io.File;
import java.io.FileFilter;
import java.io.FileReader;
import java.io.IOException;
import java.io.UncheckedIOException;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.filefilter.WildcardFileFilter;
import org.apache.commons.lang3.RandomUtils;
import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.opencsv.CSVReader;

import info.marcobrandizi.rdfutils.jena.SparqlUtils;
import uk.ac.ebi.utils.io.IOUtils;

/**
 * TODO: comment me!
 *
 * @author brandizi
 * <dl><dt>Date:</dt><dd>15 Aug 2018</dd></dl>
 *
 */
public abstract class AbstractProfiler
{
	protected String basePath;
	protected final String queryFileExtension;
	
	protected Logger log = LoggerFactory.getLogger ( SparqlUtils.class );
	protected String endPointUrl;	

	protected AbstractProfiler ( String queryFileExtension )
	{
		super ();
		this.queryFileExtension = queryFileExtension;
	}

	
	public void profile ( int repeats )
	{
		// all the tests
		String names[] = getQueryNames ( this.basePath, this.queryFileExtension );
				
		// Do it
		int counts [] = new int [ names.length ];
		double times [] = new double [ names.length ];
		for ( int rep = 0; rep < repeats; rep++ )
		{
			int i = RandomUtils.nextInt ( 0, names.length );
			counts [ i ]++;
			times [ i ] += profileQuery ( names [ i ] );
			
			if ( rep > 0 && rep % 100 == 0) log.info ( "{} runs", rep );
		}
		
		// Report
		out.println ("Name\tAvgTime");
		for ( int i = 0; i < names.length; i++  )
			out.printf ( "%s\t%f\n", getQueryId ( names [ i ] ), times [ i ] / counts [ i ] );
	}	
	
	
	protected abstract long profileQuery ( String name );

	
	/**
	 * Reads parameters from a table like basePath + name.csv.
	 */
	protected List<String[]> readParams ( String name )
	{
		File csvf = new File ( basePath + name + ".csv" );
		if ( !csvf.exists () ) return null;
		
		try ( CSVReader rdr = new CSVReader ( new FileReader ( csvf ), '\t', '"' ) ) 
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