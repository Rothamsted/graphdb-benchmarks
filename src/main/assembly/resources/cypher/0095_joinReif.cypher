MATCH (p:Protein) - [pr:is_part_of] -> (cpx:Protcmplx),
(ev:EvidenceType)
WHERE pr.evidence = ev.iri
RETURN p.prefName, cpx.prefName, ev.label
LIMIT 100
