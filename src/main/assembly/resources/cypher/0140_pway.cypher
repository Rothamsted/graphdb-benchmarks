CALL{
	MATCH (prot:Protein)-[:is_a|:ac_by]-(enz:Enzyme)-[:ac_by|:in_by]->(cmp:Comp)
	  -[:cs_by|:pd_by]->(trn:Transport)-[:part_of]->(pw:Path)
	RETURN prot, pw, "enz/cmp/trn" AS path
	UNION
	MATCH (prot:Protein)-[:is_a|:ac_by]-(enz:Enzyme)<-[:ca_by]-(trn:Transport)
		-[:part_of]->(pw:Path)
	RETURN prot, pw, "enz/trn" AS path
	UNION
	MATCH (prot:Protein)-[:pd_by|:cs_by]->(react:Reaction)-[:part_of]->(pw:Path)
	RETURN prot, pw, "react" AS path
}
RETURN DISTINCT prot.prefName, pw.prefName, path
LIMIT 100