CALL 
{
	CALL 
	{
		MATCH (p:Protein)-[:cs_by|:pd_by]->(r:Reaction)-[:part_of]->(pwy:Path)
		return pwy, COUNT(DISTINCT p) as np, r as react
	}
	
	return pwy, COUNT ( DISTINCT react ) AS nReact, 	AVG ( np ) AS avgProt
}
WITH pwy, nReact, avgProt 
WHERE nReact <= avgProt
RETURN pwy.prefName, nReact, avgProt
LIMIT 100