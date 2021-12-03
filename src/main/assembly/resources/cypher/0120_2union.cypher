MATCH (p:Protein)-[r:is_a]->(e:Enzyme)-[:ac_by|:in_by]->(c:Comp)
RETURN p.prefName, e.prefName, c.prefName, TYPE(r) AS rtype
LIMIT 100
UNION MATCH (p:Protein)<-[r:ac_by]-(e:Enzyme)-[:ac_by|:in_by]->(c:Comp)
RETURN p.prefName, e.prefName, c.prefName, TYPE(r) AS rtype
LIMIT 100
