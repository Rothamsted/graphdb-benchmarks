MATCH (p:Protein)-[:cs_by|:pd_by]->(r:Reaction)-[:part_of]->(pwy:Path)
WHERE NOT EXISTS
  ( (p)-[:is_a|:ac_by]-(:Enzyme)-[:ac_by|:in_by]->(:Comp)
  -[:cs_by|pd_by]->(:Transport)-[:part_of]->(:Path) )
AND NOT EXISTS
  ( (p)-[:is_a|:ac_by]-(:Enzyme)<-[:ca_by]-(:Transport)-[:part_of]->(:Path) )
WITH 
  pwy.prefName AS pwy,
  COUNT ( DISTINCT p ) AS np, r AS react
WITH
  pwy AS pwy, COUNT ( DISTINCT react ) AS nReact,
  AVG ( np ) AS avgProt
WHERE nReact <= avgProt
RETURN pwy, nReact, avgProt
LIMIT 100
