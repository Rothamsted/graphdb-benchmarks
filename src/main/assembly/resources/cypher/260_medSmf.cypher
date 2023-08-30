MATCH path = (gene:Gene) - [:enc] -> (prot:Protein)
  - [:h_s_s|ortho|xref*0..2] - (prot1:Protein)
  - [:is_a|ac_by] - (enz:Enzyme)
  - [:ac_by|in_by] -> (cmp:Comp)
  - [:cs_by|pd_by] -> (trn:Transport) 
  - [:part_of*0..3] -> (pwy:Path)

RETURN 
  // This is to emulate the corresponding SPARQL, see 250_shrtSmf.cypher
  [ n in nodes(path) | n.iri ] as nodeIris
LIMIT 100