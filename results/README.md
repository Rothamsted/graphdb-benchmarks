# Benchmarking kNetMiner data, Neo4j vs Virtuoso

## Test results

  * See this [Excel file](gdb_benchmark_results.xlsx). It is recommended that you first read this document.


## Test conditions

  * Hardware: MacBook Pro, 2.9 GHz Intel Core i7, 16GB RAM
  * Both the servers and the client (this package) are run on the same computer, thus network latency is minimsed
  * Only one server at a time is on while running a test of a given type (Neo4j/Virtuoso)
  

## Test approach

  * For each database (Neo4/Virtuoso) a number of query typed is tested (see below). For each query type  a Cypher 
  and a SPARQL version were written, aiming at keeping the same or very similar semantics, as well as similar 
  graph patterns and other language constructs known to affect the database performance (e.g., filters, `ORDER BY` clauses).

  * Queries were written cosidering:
  	* the typical query needs for our data
  	* the aim to test particular query language operations and features
  	* taking example from existing benchmarks (e.g., TODO)
  	* Certain queries are instantiated with parameters at each execution (e.g., `joinFilter` retrieves proteins by name,
  	the name is a required parameter). For those cases, files with predefined parameter valued were prepared (taking values
  	from the database). Every time the query has to be executed, a value is picked randomly and injected into the query.   
  
  * There are two test types: [Cypher](../src/main/java/uk/ac/rothamsted/rdf/benchmarks/CypherProfiler.java) and 
	[Sparql](../src/main/java/uk/ac/rothamsted/rdf/benchmarks/SparqlProfiler.java), which are run separately. 
	Every test type is based on the procedure:

    1. The Database server is started
    1. A number of predefined iterations (usually a few thousands) are run, for each iteration:
      1. a query is randomly selected from the set of competence ([Cypher](../src/main/assembly/resources/cypher), 
			or [SPARQL](src/main/assembly/resources/sparql))
      1. if it's a parametric query, a random parameter is chosen (see above)
      1. the query is run, the execution time is tracked. We track the time going from when the query string is sent to
      the server to when the first result is fetched. This includes network latency, which we want include in the
      evaluation, for several reasons:
      	1. network latency is a small overhead and comparable between the two datbase engines (our primary goal is to
      	compare the two)
      	1. in real use cases it is a relevant time
    1. At the end of all the iterations, the times of each query are averaged and results are reported.    
  
	* Repeating the queries is done to get an average behavoir, running them in random order avoids biases like the 
  exploitation of caches. We are not testing the parallel performance (i.e., many clients running queries simultaneously)
  since we're interested in comparing speeds with respect to the query types.
  

## Queries 

  1. **cnt**: Counts instances, [Cypher](../src/main/assembly/resources/cypher/0010_cnt.cypher), [SPARQL](../src/main/assembly/resources/sparql/0010_cnt.sparql)
  2. **cntType**: Instances of a given type, [Cypher](../src/main/assembly/resources/cypher/0020_cntType.cypher), [SPARQL](../src/main/assembly/resources/sparql/0020_cntType.sparql)
  3. **cntRel**: Count relations, [Cypher](../src/main/assembly/resources/cypher/0030_cntRel.cypher), [SPARQL](../src/main/assembly/resources/sparql/0030_cntRel.sparql)
  4. **cntRelType**: CountRelations of a given type, [Cypher](../src/main/assembly/resources/cypher/0040_cntRelType.cypher), [SPARQL](../src/main/assembly/resources/sparql/0040_cntRelType.sparql)
  5. **sel**: Select entity and properties, [Cypher](../src/main/assembly/resources/cypher/0050_sel.cypher), [SPARQL](../src/main/assembly/resources/sparql/0050_sel.sparql)
  6. **join**: Simple Join, [Cypher](../src/main/assembly/resources/cypher/0060_join.cypher), [SPARQL](../src/main/assembly/resources/sparql/0060_join.sparql)
  7. **joinRel**: Join matching relation, [Cypher](../src/main/assembly/resources/cypher/0070_joinRel.cypher), [SPARQL](../src/main/assembly/resources/sparql/0070_joinRel.sparql)
  8. **joinFilter**: Simple join + attribute filter, [Cypher](../src/main/assembly/resources/cypher/0080_joinFilter.cypher), [SPARQL](../src/main/assembly/resources/sparql/0080_joinFilter.sparql)
  9. **joinRe**: Simple join + regex search, [Cypher](../src/main/assembly/resources/cypher/0090_joinRe.cypher), [SPARQL](../src/main/assembly/resources/sparql/0090_joinRe.sparql)
  10. **joinReif**: Join through relation property, [Cypher](../src/main/assembly/resources/cypher/0095_joinReif.cypher), [SPARQL](../src/main/assembly/resources/sparql/0095_joinReif.sparql)
  11. **varPathC**: Variable path query (max len), [Cypher](../src/main/assembly/resources/cypher/0100_varPathC.cypher), [SPARQL](../src/main/assembly/resources/sparql/0100_varPathC.sparql)
  12. **varPath**: Variable path query (unbound len and top restricted), [Cypher](../src/main/assembly/resources/cypher/0110_varPath.cypher), [SPARQL](../src/main/assembly/resources/sparql/0110_varPath.sparql)
  13. **2union**: 2 unions, no nesting, [Cypher](../src/main/assembly/resources/cypher/0120_2union.cypher), [SPARQL](../src/main/assembly/resources/sparql/0120_2union.sparql)
  14. **2union1Nest**: 2 unions, 1 nesting, [Cypher](../src/main/assembly/resources/cypher/0130_2union1Nest.cypher), [SPARQL](../src/main/assembly/resources/sparql/0130_2union1Nest.sparql)
  15. **pway**: Complex union of paths over pathways, [Cypher](../src/main/assembly/resources/cypher/0140_pway.cypher), [SPARQL](../src/main/assembly/resources/sparql/0140_pway.sparql)
  16. **grp**: Group by, [Cypher](../src/main/assembly/resources/cypher/0150_grp.cypher), [SPARQL](../src/main/assembly/resources/sparql/0150_grp.sparql)
  17. **grpAg**: Group by + 2 aggregation functions, [Cypher](../src/main/assembly/resources/cypher/0170_grpAg.cypher), [SPARQL](../src/main/assembly/resources/sparql/0170_grpAg.sparql)
  18. **mulGrpAg**: Multiple subqueries having aggregations , [Cypher](../src/main/assembly/resources/cypher/0180_mulGrpAg.cypher), [SPARQL](../src/main/assembly/resources/sparql/0180_mulGrpAg.sparql)
  19. **nestAg**: Nested and outer aggregations (see Q6 at https://goo.gl/v4YbQ2), [Cypher](../src/main/assembly/resources/cypher/0190_nestAg.cypher), [SPARQL](../src/main/assembly/resources/sparql/0190_nestAg.sparql)
  20. **exist**: Not exists, [Cypher](../src/main/assembly/resources/cypher/0200_exist.cypher), [SPARQL](../src/main/assembly/resources/sparql/0200_exist.sparql)
  21. **existAg**: Not exists + aggregation, [Cypher](../src/main/assembly/resources/cypher/0210_existAg.cypher), [SPARQL](../src/main/assembly/resources/sparql/0210_existAg.sparql)
