MATCH (prot:Protein)-[:pd_by|:cs_by]->(react:Reaction)-[:part_of]->(pw:Path)
WITH COUNT ( DISTINCT prot ) AS nReactProts, react AS react, pw.prefName AS pway
RETURN DISTINCT pway, AVG (nReactProts) AS avgReactProts
LIMIT 100
