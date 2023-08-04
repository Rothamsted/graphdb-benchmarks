MATCH (p:Protein) 
RETURN p.description, p.prefName, rand() AS rnd
ORDER BY rnd
LIMIT 100
