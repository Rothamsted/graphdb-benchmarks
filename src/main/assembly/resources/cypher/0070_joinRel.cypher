MATCH (p:Protein) - [pr:is_part_of] -> (cpx:Protcmplx)
RETURN p.prefName, cpx.prefName, pr.evidence, rand() AS rnd
ORDER BY rnd
LIMIT 100
