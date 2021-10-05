MATCH (prot:Protein)-[:is_a|:ac_by]-(enz:Enzyme)-[:ac_by|:in_by]->(cmp:Comp)
  -[:cs_by|:pd_by]->(trn:Transport)-[:part_of]->(pw:Path)
RETURN prot.prefName, pw.prefName, "enz/cmp/trn" AS path
LIMIT 100
UNION
MATCH (prot:Protein)-[:is_a|:ac_by]-(enz:Enzyme)<-[:ca_by]-(trn:Transport)
  -[:part_of]->(pw:Path)
RETURN prot.prefName, pw.prefName, "enz/trn" AS path
LIMIT 100
UNION
MATCH (prot:Protein)-[:pd_by|:cs_by]->(react:Reaction)-[:part_of]->(pw:Path)
RETURN prot.prefName, pw.prefName, "react" AS path
LIMIT 100
