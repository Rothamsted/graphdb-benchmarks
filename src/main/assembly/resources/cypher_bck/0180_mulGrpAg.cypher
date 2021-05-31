MATCH (prot:Protein)-[:is_a|:ac_by]-(enz:Enzyme),
  (trn:Transport)-[:part_of]->(pwy:Path)
WHERE 
  (enz)-[:ac_by|:in_by]->(:Comp)-[:cs_by|pd_by]->(trn)
        OR (trn)-[:ca_by]->(enz)
RETURN 
  DISTINCT pwy.prefName,
  COUNT ( DISTINCT prot ) AS n,
  "enz" AS TYPE
LIMIT 100
UNION
MATCH (prot:Protein)-[:cs_by|:pd_by]->(:Reaction)-[:part_of]->(pwy)
RETURN 
  DISTINCT pwy.prefName,
  COUNT ( DISTINCT prot ) AS n,
  "react" AS TYPE
LIMIT 100
