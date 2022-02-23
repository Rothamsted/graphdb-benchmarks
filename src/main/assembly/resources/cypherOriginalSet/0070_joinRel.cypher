MATCH (p:Protein) - [pr:is_part_of] -> (cpx1:Protcmplx),
(ev:EvidenceType)
WHERE pr.evidence = ev.iri
RETURN p.prefName, cpx1.prefName, ev.label
LIMIT 100
