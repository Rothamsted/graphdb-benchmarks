MATCH (class:BioProc) - [:is_a*$steps] -> (top:BioProc)
RETURN DISTINCT ID(class), ID(top)
LIMIT 100
