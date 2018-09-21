MATCH (p:Protein) - [:is_part_of] -> (cpx1:Protcmplx) - [:is_part_of] -> (cpx2:Protcmplx)
RETURN p, cpx1, cpx2 LIMIT 100
