MATCH (p:Protein)-[:cs_by|:pd_by]->(r:Reaction)-[:part_of]->(pwy:Path)
WHERE NOT EXISTS
  ( (p)-[:is_a|:ac_by]-(:Enzyme)-[:ac_by|:in_by]->(:Comp)
  -[:cs_by|pd_by]->(:Transport)-[:part_of]->(:Path) )
AND NOT EXISTS
  ( (p)-[:is_a|:ac_by]-(:Enzyme)<-[:ca_by]-(:Transport)-[:part_of]->(:Path) )
RETURN DISTINCT pwy.prefName, p.prefName
LIMIT 100
