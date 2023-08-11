MATCH path = (gene:Gene) - [:enc] -> (prot:Protein)
  - [:h_s_s|ortho|xref*0..2] - (prot1:Protein)
  - [:is_a|ac_by] - (enz:Enzyme)
  - [:ac_by|in_by] -> (cmp:Comp)
  - [:cs_by|pd_by] -> (trn:Transport) 
  - [:part_of*0..3] -> (pwy:Path)

/* TODO: Can't reproduce in SPARQL, probably due to a different interpretation of 0-len property
   path
  <- [:part_of*0..1] - (react:Reaction)
  <- [:cs_by|pd_by*0..1] - (rprot:Protein)
  <- [:h_s_s|ortho|xref*0..1] - (rprot1:Protein) */  
RETURN 
  [ n in nodes(path) | n.iri ] as nodeIris, 
  [ r in relationships(path) | r.iri ] as relIris,
  rand() AS rnd
ORDER BY rnd
LIMIT 100