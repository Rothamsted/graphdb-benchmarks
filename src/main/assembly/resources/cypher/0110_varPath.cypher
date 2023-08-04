MATCH (class:BioProc) - [:is_a*] -> (top:BioProc)
WHERE NOT EXISTS ( (top) - [:is_a] -> () )
RETURN DISTINCT ID(class), ID(top), rand() AS rnd
ORDER BY rnd
LIMIT 100
