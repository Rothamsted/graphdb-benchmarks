MATCH (class:BioProc) - [:is_a*$steps] -> (top:BioProc)
RETURN DISTINCT ID(class), ID(top), rand() AS rnd
ORDER BY rnd
LIMIT 100
