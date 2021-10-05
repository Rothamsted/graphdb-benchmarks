MATCH (class:BioProc) - [:is_a*] -> (top:BioProc)
WHERE NOT EXISTS ( (top) - [:is_a] -> () )
RETURN DISTINCT class,top
LIMIT 100
