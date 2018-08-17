MATCH (p:Protein)-[:cs_by|:pd_by]->(r:Reaction)-[:part_of]->(pwy:Path)
WITH 
  pwy.prefName AS pwy,
  COUNT ( DISTINCT p ) AS np, r AS react
WITH
  pwy AS pwy, COUNT ( DISTINCT react ) AS nReact,
  AVG ( np ) AS avgProt
WHERE nReact <= avgProt
RETURN pwy, nReact, avgProt
LIMIT 100