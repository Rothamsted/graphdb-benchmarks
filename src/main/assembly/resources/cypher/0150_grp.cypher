MATCH (prot:Protein)-[:pd_by|:cs_by]->(react:Reaction)-[:part_of]->(pw:Path)
RETURN COUNT ( DISTINCT prot ) AS nprots, pw.prefName
LIMIT 100
