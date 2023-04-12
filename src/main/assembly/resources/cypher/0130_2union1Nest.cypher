MATCH (p:Protein)-[r:is_a]->(e:Enzyme)
WITH COLLECT ({prot:p, react:r, enz:e}) AS rows
MATCH (p:Protein)<-[r:ac_by]-(e:Enzyme)
WITH rows + COLLECT ({prot:p, react:r, enz:e}) AS allRows
UNWIND allRows AS row
WITH row.prot AS p, row.react AS r, row.enz AS e
MATCH (e)-[:ac_by|:in_by]->(c:Comp)
RETURN p.prefName, e.prefName, TYPE (r) AS rtype, c.prefName
LIMIT 100

