MATCH (g:Gene {iri:'$iri'})-[:has_variation]->(s:SNP)-[:associated_with]->(t:Trait)
RETURN g.prefName, t.prefName


