MATCH (g:Gene {iri:'$iri'})<-[:cooc_wi]-(t:Trait)
RETURN g.prefName, t.prefName
