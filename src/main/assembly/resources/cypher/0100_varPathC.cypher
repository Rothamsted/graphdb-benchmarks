MATCH (class:BioProc) - [:is_a*$steps] -> (top:BioProc)
RETURN ID(class), ID(top)
LIMIT 100
