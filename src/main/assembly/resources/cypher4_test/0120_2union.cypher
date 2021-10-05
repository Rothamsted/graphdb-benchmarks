CALL {
	MATCH (p:Protein)-[r:is_a]->(e:Enzyme)-[:ac_by|:in_by]->(c:Comp)
	RETURN p, e, c, r 
	UNION 
	MATCH (p:Protein)<-[r:ac_by]-(e:Enzyme)-[:ac_by|:in_by]->(c:Comp)
	RETURN p, e, c, r
}
 RETURN DISTINCT p.prefName, e.prefName, c.prefName, TYPE(r) AS rtype
 LIMIT 100 