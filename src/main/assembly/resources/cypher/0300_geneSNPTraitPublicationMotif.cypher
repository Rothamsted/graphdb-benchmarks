MATCH (g:Gene {iri:'$iri'})-[:has_variation]->(s:SNP)-[:associated_with]->(t:Trait)-[:pub_in]->(p:Publication)
RETURN g.prefName, p.prefName