package uk.ac.rothamsted.rdf.benchmarks;

import static java.lang.System.out;

import java.io.FileReader;
import java.io.IOException;
import java.io.UncheckedIOException;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import java.util.SortedMap;
import java.util.stream.Collector;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.apache.commons.lang3.tuple.Pair;

import com.arcadedb.serializer.json.JSONObject;
import com.google.common.collect.HashMultimap;
import com.google.common.collect.SetMultimap;
import com.google.common.collect.SortedSetMultimap;
import com.google.common.collect.TreeMultimap;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.opencsv.CSVParser;
import com.opencsv.CSVParserBuilder;
import com.opencsv.CSVReader;
import com.opencsv.CSVReaderBuilder;

import uk.ac.ebi.utils.exceptions.ExceptionUtils;
import uk.ac.ebi.utils.opt.io.IOUtils;

/**
 * Lists the test queries.
 *
 * @author brandizi
 * <dl><dt>Date:</dt><dd>16 Aug 2018</dd></dl>
 *
 */
public class QueryList
{
	public static void listQueries ( String basePath, String urlPrefix )
	{
		listQueries ( 
			basePath + "sparql/", basePath + "cypher/", basePath + "gremlin/", urlPrefix 
		);
	}

	/**
	 * Reports a query list in Markdown format. This is used to update the main README.
	 */
	public static void listQueries ( 
		String sparqlPath, String cypherPath, String gremlinPath, String urlPrefix )
	{
		String[] qnames = AbstractProfiler.getQueryNames ( sparqlPath, "sparql" );
		Map<String, String> qgroups = getQueryGroupDescriptions ( sparqlPath ); 
		
		SetMultimap<String, String> groupedQueries = groupQueries ( sparqlPath, qnames );
		
		qgroups.forEach ( (qgroup, qgdescr) -> 
		{
			out.format ( "\n\n### Category: %s\n", qgroup );
			out.format ( "\n%s\n\n", qgdescr );
			
			Set<String> gqueries = groupedQueries.get ( qgroup );
			
			for ( String qname: qnames )
			{
				if ( !gqueries.contains ( qname ) ) continue;

				String sparqlQPath = sparqlPath + qname + ".sparql";
				String qid = AbstractProfiler.getQueryId ( qname );
				String sparqlStr = getQueryString ( sparqlQPath );
				String qdescr = getQueryDescr ( sparqlStr );
				
				String sparqlUrl = urlPrefix + sparqlQPath;
				String cyUrl = urlPrefix + cypherPath + qname + ".cypher";
				String gremlinUrl = urlPrefix + gremlinPath + qname + ".gremlin";
				
				out.format ( 
					"1. **%s**: %s, [SPARQL](%s), [Cypher](%s), [Gremlin](%s)\n",
					qid, qdescr, sparqlUrl, cyUrl, gremlinUrl	
				);
			}
			
		});

	}
	
	public static void listQueriesAsJsonFromBasePath ( String basePath )
	{
		listQueriesAsJson ( basePath + "sparql/" );
	}
	
	
	/**
	 * Lists query groups and query IDs as JSON objects. Used for Jupyter reports.
	 */
	public static void listQueriesAsJson ( String sparqlPath )
	{
		String[] qnames = AbstractProfiler.getQueryNames ( sparqlPath, "sparql" );
		Map<String, String> qgroups = getQueryGroupDescriptions ( sparqlPath ); 
		
		SetMultimap<String, String> groupedQueries = groupQueries ( sparqlPath, qnames );

		var js = new JsonObject ();
		
		qgroups.forEach ( (qgroup, qgdescr) -> 
		{
			var jgroup = new JsonArray ();
			
			Set<String> gqueries = groupedQueries.get ( qgroup );
			
			for ( String qname: qnames )
			{
				if ( !gqueries.contains ( qname ) ) continue;

				String qid = AbstractProfiler.getQueryId ( qname );
				jgroup.add ( qid );
			}
			
			js.add ( qgroup, jgroup );
		});
		
		Gson gson = new GsonBuilder ()
			.setPrettyPrinting()
			.create();
				
		out.println ( gson.toJson ( js ) );
	}
	
	/**
	 * Groups queries based on {@link #getQueryGroup(String)}
	 */
	private static SetMultimap<String, String> groupQueries ( String sparqlPath, String[] queryNames )
	{
		SetMultimap<String, String> groups = HashMultimap.create ();
		
		for ( String qname: queryNames )
		{
			String sparqlStr = getQueryString ( sparqlPath + qname + ".sparql" );
			
			String qgroup = getQueryGroup ( sparqlStr );
			
			groups.put ( qgroup, qname );
		}
		
		return groups;
	}
	
	/**
	 * Gets the query description from {@link #getQueryDescrRaw(String)} and removes the initial
	 * [group] tag.
	 */
	private static String getQueryDescr ( String sparqlStr )
	{
		String descr = getQueryDescrRaw ( sparqlStr );
		descr = descr.replaceAll ( "^\\[.+\\] ", "" );
		return descr;
	}
	
	/**
	 * Gets the initial [group] annotation from the {@link #getQueryDescrRaw(String) query description}.
	 */
	private static String getQueryGroup ( String sparqlStr )
	{
		String descr = getQueryDescrRaw ( sparqlStr );
		String group = descr.replaceAll ( "^\\[(.+)\\] .*", "$1" );
		return group;
	}
	
	/**
	 * Simply gets the first comment line from a SPARQL query text.
	 * 
	 * This might contain a "# [query group]" annotation at the begin of the comment, which 
	 * other methods can process.
	 * 
	 */
	private static String getQueryDescrRaw ( String sparqlStr )
	{
		return sparqlStr.split ( "\n" ) [ 0 ].replace ( "# ", "" );
	}
	
	/**
	 * Get the query text from its file.
	 */
	private static String getQueryString ( String queryPath )
	{
		String sparqlStr = IOUtils.readFile ( queryPath  );
		return sparqlStr;
	}
	
	/**
	 * Get query groups list and descriptions, as provided from a TSV file in the SPARQL path
	 * 
	 */
	private static Map<String, String> getQueryGroupDescriptions ( String sparqlPath )
	{
		String gdescrsPath = sparqlPath + "query-group-descriptions.tsv";
		
		CSVParser csvParser = new CSVParserBuilder ()
			.withSeparator ( '\t' )
			.withQuoteChar ( '"' )
			.withEscapeChar ( '\\' )
			.build ();
		
		try ( CSVReader rdr = new CSVReaderBuilder ( new FileReader ( gdescrsPath ) )
																.withCSVParser ( csvParser )
																.build ();
		) 
		{
			Map<String, String> groupDescrs = rdr.readAll ()
			.stream ()
			.collect ( Collectors.toMap (
			    line -> line [ 0 ],
			    line -> line [ 1 ],
			    (g1, g2) -> g1,
			    LinkedHashMap::new
			));
			return groupDescrs;
		}
		catch ( IOException ex ) {
			throw ExceptionUtils.buildEx ( 
				UncheckedIOException.class,
				"Error while loading query group descriptions: $cause"
			);
		}		
	}
}
