CALL {
	MATCH (p:Protein)-[r:is_a]->(e:Enzyme)
	return p,r,e 
	UNION 
	MATCH (p:Protein)<-[r:ac_by]-(e:Enzyme)
	return p,r,e
}
MATCH (e)-[:ac_by|:in_by]->(c:Comp)
RETURN p.prefName, e.prefName, TYPE (r) AS rtype, c.prefName
LIMIT 100 

