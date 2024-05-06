/*
MATCH (prot:Protein)-[pr:pd_by|cs_by]->(:Reaction)-[:part_of]->(pw:Path),
(c:Concept)
WHERE pr.relatedConcept = c.iri
RETURN DISTINCT pw.prefName, c.prefName, LABELS ( c ), prot.prefName
LIMIT 100
*/

MATCH {type: `Concept:Protein:Resource`, as: prot}
 .outE('pd_by', 'cs_by'){as: pr}.inV(){type: `Concept:Reaction:Resource`}
 .outE('part_of'){as: e}.inV(){type: `Concept:Path:Resource`, as: pw}
RETURN DISTINCT pw.prefName, c.prefName, c.@type, prot.prefName
LIMIT 100


