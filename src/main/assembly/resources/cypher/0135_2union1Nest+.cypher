// This is like 2union1Nest, but realised with the new CALL() construct introduced in 
// recent Cypher. Performance should be the same, readability should be better
CALL {
  MATCH (p:Protein)-[r:is_a]->(e:Enzyme)
  RETURN e, p.prefName AS proteinName, e.prefName AS enzName, TYPE(r) AS relType
  
  UNION 
  MATCH (p:Protein)<-[r:ac_by]-(e:Enzyme)
  RETURN e, p.prefName AS proteinName, e.prefName AS enzName, TYPE(r) AS relType
}
WITH e, proteinName, enzName, relType
MATCH (e)-[:ac_by|:in_by]->(c:Comp)
RETURN proteinName, enzName, relType, c.prefName
LIMIT 100
