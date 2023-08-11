CALL {
	CALL {
		MATCH (prot:Protein) - [:cs_by|pd_by] -> (react:Reaction) - [:part_of] -> (pwy:Path)
		RETURN pwy, react, COUNT(DISTINCT prot) as np
	}
	RETURN pwy, COUNT ( DISTINCT react ) AS nReact, AVG ( np ) AS avgProt
}
WITH pwy, nReact, avgProt 
WHERE nReact <= avgProt
RETURN pwy.prefName, nReact, avgProt
// DEBUG ORDER BY pwy.prefName
LIMIT 100