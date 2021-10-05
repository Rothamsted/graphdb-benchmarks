MATCH (p:Protein) - [:is_part_of] -> (cpx1:Protcmplx) - [:is_part_of] -> (cpx2:Protcmplx)
WHERE p.prefName =~ "(?i).*$protWord.*"
RETURN p.prefName, cpx1.prefName, cpx2.prefName LIMIT 100
