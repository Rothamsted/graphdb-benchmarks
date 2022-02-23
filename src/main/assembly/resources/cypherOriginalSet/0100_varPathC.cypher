MATCH (class:BioProc) - [:is_a*$steps] - (top:BioProc)
RETURN class,top
LIMIT 100
