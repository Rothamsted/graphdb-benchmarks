CALL {
	MATCH (prot:Protein)-[:pd_by|:cs_by]->(react:Reaction)-[:part_of]->(pw:Path)
	RETURN COUNT ( DISTINCT prot ) AS nReactProts, react, pw
}
RETURN DISTINCT pw.prefName, AVG(nReactProts) AS avgReactProts
LIMIT 100
