MATCH (p:Protein) - [pr:is_part_of] -> (cpx:Protcmplx)
RETURN p.prefName, cpx.prefName, pr.evidence
LIMIT 100
