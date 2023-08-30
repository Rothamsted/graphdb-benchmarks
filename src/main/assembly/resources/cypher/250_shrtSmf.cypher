MATCH path = (gene:Gene) - [:has_mutant|has_variation] -> (snp:SNP) 
  - [:associated_with] -> (pheno:Phenotype)
  - [:part_of] -> (trait:Trait)
  - [:is_a*0..1] -> (parent:Trait) 
RETURN
  // This is to emulate the corresponding SPARQL, which returns node IRIs only
  // Returning the whole path is time consuming and distorts the speed engine assessment.  
  [ n in nodes(path) | n.iri ] as nodeIris
LIMIT 100
