CALL {
	MATCH (prot:Protein) - [:is_a|ac_by] - (enz:Enzyme)
	
	// Two ways to transport
	CALL { 
	  WITH enz
	  MATCH (enz) - [:ac_by|:in_by] -> (:Comp) - [:cs_by|pd_by] -> (trn:Transport)
	  RETURN trn

	  UNION

	  WITH enz
	  MATCH (trn:Transport) - [:ca_by] -> (enz)
	  RETURN trn
	}
	
	// From either transport to pathway
	MATCH (trn:Transport) - [:part_of] -> (pwy:Path)
	RETURN DISTINCT pwy, COUNT ( DISTINCT prot ) AS n, "enz" AS type

	UNION

  // To pathway, via protein and reaction
	MATCH (prot:Protein) - [:cs_by|pd_by] -> (:Reaction) - [:part_of] -> (pwy:Path)
	RETURN DISTINCT pwy, COUNT ( DISTINCT prot ) AS n, "react" AS type
}
RETURN DISTINCT pwy.prefName, type, n
LIMIT 100