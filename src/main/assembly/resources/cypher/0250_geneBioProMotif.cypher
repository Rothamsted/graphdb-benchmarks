MATCH (g:Gene {iri:'$iri'})-[participates_in]->(b:BioProc)
RETURN g.prefName, b.prefName