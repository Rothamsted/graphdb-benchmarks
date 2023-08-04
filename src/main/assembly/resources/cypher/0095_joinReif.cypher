MATCH (p:Protein) - [pr:is_part_of] -> (cpx:Protcmplx),
(ev:EvidenceType)
WHERE pr.evidence = ev.iri
RETURN p.prefName, cpx.prefName, ev.label, rand() AS rnd
ORDER BY rnd
LIMIT 100
