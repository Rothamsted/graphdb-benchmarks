MATCH (prot:Protein)-[pr:pd_by|:cs_by]->(:Reaction)-[:part_of]->(pw:Path),
(c:Concept)
WHERE pr.relatedConcept = c.iri
RETURN DISTINCT pw.prefName, c.prefName, LABELS ( c ), prot.prefName
LIMIT 100
