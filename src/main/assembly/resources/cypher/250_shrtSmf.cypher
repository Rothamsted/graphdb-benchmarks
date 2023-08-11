MATCH path = (gene:Gene) - [:has_mutant|has_variation] -> (snp:SNP) 
  - [:associated_with] -> (pheno:Phenotype)
  - [:part_of] -> (trait:Trait)
  - [:is_a*0..1] -> (parent:Trait) 
RETURN 
  [ n in nodes(path) | n.iri ] as nodeIris, 
  [ r in relationships(path) | r.iri ] as relIris,
  rand() AS rnd
ORDER BY rnd
LIMIT 100
