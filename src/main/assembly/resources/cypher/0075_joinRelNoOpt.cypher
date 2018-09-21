MATCH (p:Protein) - [pr:is_part_of] -> (cpx1:Protcmplx),
(ev:EvidenceType)
WHERE pr.evidence = ev.iri
RETURN p, cpx1, ev
LIMIT 100
