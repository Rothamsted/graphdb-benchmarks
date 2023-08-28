MATCH path = (gene:Gene) - [:enc] -> (prot:Protein)
  - [:h_s_s|ortho|xref*0..3] - (prot1:Protein)
  - [:is_a|ac_by] - (enz:Enzyme)
  - [:ac_by|in_by] -> (cmp:Comp)
  - [:cs_by|pd_by] -> (trn:Transport) 
  - [:part_of*1..3] -> (pwy:Path)

  // Go back to other proteins in this reaction
  <- [:part_of*1..3] - (react:Reaction)
  <- [:cs_by|pd_by*0..3] - (rprot:Protein)
  - [:h_s_s|ortho|xref*0..2] - (rprot1:Protein)
  <- [:enc*0..1] - (rgene) 
RETURN 
  // This is to emulate the corresponding SPARQL, see 270_lngSmf.cypher 
  [ n in nodes(path) | n.iri ] as nodeIris, 
  rand() AS rnd
ORDER BY rnd
LIMIT 100