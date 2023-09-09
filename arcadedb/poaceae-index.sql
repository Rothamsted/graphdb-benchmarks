BEGIN;
CREATE PROPERTY `Accession:Resource`.identifier IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Accession:Resource` ( identifier ) NOTUNIQUE;
CREATE PROPERTY `BioProc:Concept:Resource`.identifier IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `BioProc:Concept:Resource` ( identifier ) NOTUNIQUE;
CREATE PROPERTY `CelComp:Concept:Resource`.identifier IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `CelComp:Concept:Resource` ( identifier ) NOTUNIQUE;
CREATE PROPERTY `CoExpCluster:Concept:Resource`.identifier IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `CoExpCluster:Concept:Resource` ( identifier ) NOTUNIQUE;
CREATE PROPERTY `CoExpStudy:Concept:Resource`.identifier IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `CoExpStudy:Concept:Resource` ( identifier ) NOTUNIQUE;
CREATE PROPERTY `Comp:Concept:Resource`.identifier IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Comp:Concept:Resource` ( identifier ) NOTUNIQUE;
CREATE PROPERTY `Concept:EC:Resource`.identifier IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:EC:Resource` ( identifier ) NOTUNIQUE;
CREATE PROPERTY `Concept:Enzyme:Resource`.identifier IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Enzyme:Resource` ( identifier ) NOTUNIQUE;
CREATE PROPERTY `Concept:Gene:Resource`.identifier IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Gene:Resource` ( identifier ) NOTUNIQUE;
CREATE PROPERTY `Concept:MolFunc:Resource`.identifier IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:MolFunc:Resource` ( identifier ) NOTUNIQUE;
CREATE PROPERTY `Concept:Path:Resource`.identifier IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Path:Resource` ( identifier ) NOTUNIQUE;
CREATE PROPERTY `Concept:Phenotype:Resource`.identifier IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Phenotype:Resource` ( identifier ) NOTUNIQUE;
CREATE PROPERTY `Concept:PlantOntologyTerm:Reso...`.identifier IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:PlantOntologyTerm:Reso...` ( identifier ) NOTUNIQUE;
CREATE PROPERTY `Concept:Protcmplx:Resource`.identifier IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Protcmplx:Resource` ( identifier ) NOTUNIQUE;
CREATE PROPERTY `Concept:ProtDomain:Resource`.identifier IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:ProtDomain:Resource` ( identifier ) NOTUNIQUE;
CREATE PROPERTY `Concept:Protein:Resource`.identifier IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Protein:Resource` ( identifier ) NOTUNIQUE;
CREATE PROPERTY `Concept:Publication:Resource`.identifier IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Publication:Resource` ( identifier ) NOTUNIQUE;
CREATE PROPERTY `Concept:Reaction:Resource`.identifier IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Reaction:Resource` ( identifier ) NOTUNIQUE;
CREATE PROPERTY `Concept:Resource:SNP`.identifier IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Resource:SNP` ( identifier ) NOTUNIQUE;
CREATE PROPERTY `Concept:Resource:SNPEffect`.identifier IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Resource:SNPEffect` ( identifier ) NOTUNIQUE;
CREATE PROPERTY `Concept:Resource:Species`.identifier IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Resource:Species` ( identifier ) NOTUNIQUE;
CREATE PROPERTY `Concept:Resource:Trait`.identifier IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Resource:Trait` ( identifier ) NOTUNIQUE;
CREATE PROPERTY `Concept:Resource:Transport`.identifier IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Resource:Transport` ( identifier ) NOTUNIQUE;
CREATE PROPERTY `DataSource:EvidenceType:Resour...`.identifier IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `DataSource:EvidenceType:Resour...` ( identifier ) NOTUNIQUE;
CREATE PROPERTY `DataSource:Resource`.identifier IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `DataSource:Resource` ( identifier ) NOTUNIQUE;
CREATE PROPERTY `EvidenceType:Resource`.identifier IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `EvidenceType:Resource` ( identifier ) NOTUNIQUE;
CREATE PROPERTY `Accession:Resource`.prefName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Accession:Resource` ( prefName ) NOTUNIQUE;
CREATE PROPERTY `BioProc:Concept:Resource`.prefName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `BioProc:Concept:Resource` ( prefName ) NOTUNIQUE;
CREATE PROPERTY `CelComp:Concept:Resource`.prefName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `CelComp:Concept:Resource` ( prefName ) NOTUNIQUE;
CREATE PROPERTY `CoExpCluster:Concept:Resource`.prefName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `CoExpCluster:Concept:Resource` ( prefName ) NOTUNIQUE;
CREATE PROPERTY `CoExpStudy:Concept:Resource`.prefName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `CoExpStudy:Concept:Resource` ( prefName ) NOTUNIQUE;
CREATE PROPERTY `Comp:Concept:Resource`.prefName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Comp:Concept:Resource` ( prefName ) NOTUNIQUE;
CREATE PROPERTY `Concept:EC:Resource`.prefName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:EC:Resource` ( prefName ) NOTUNIQUE;
CREATE PROPERTY `Concept:Enzyme:Resource`.prefName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Enzyme:Resource` ( prefName ) NOTUNIQUE;
CREATE PROPERTY `Concept:Gene:Resource`.prefName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Gene:Resource` ( prefName ) NOTUNIQUE;
CREATE PROPERTY `Concept:MolFunc:Resource`.prefName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:MolFunc:Resource` ( prefName ) NOTUNIQUE;
CREATE PROPERTY `Concept:Path:Resource`.prefName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Path:Resource` ( prefName ) NOTUNIQUE;
CREATE PROPERTY `Concept:Phenotype:Resource`.prefName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Phenotype:Resource` ( prefName ) NOTUNIQUE;
CREATE PROPERTY `Concept:PlantOntologyTerm:Reso...`.prefName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:PlantOntologyTerm:Reso...` ( prefName ) NOTUNIQUE;
CREATE PROPERTY `Concept:Protcmplx:Resource`.prefName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Protcmplx:Resource` ( prefName ) NOTUNIQUE;
CREATE PROPERTY `Concept:ProtDomain:Resource`.prefName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:ProtDomain:Resource` ( prefName ) NOTUNIQUE;
CREATE PROPERTY `Concept:Protein:Resource`.prefName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Protein:Resource` ( prefName ) NOTUNIQUE;
CREATE PROPERTY `Concept:Publication:Resource`.prefName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Publication:Resource` ( prefName ) NOTUNIQUE;
CREATE PROPERTY `Concept:Reaction:Resource`.prefName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Reaction:Resource` ( prefName ) NOTUNIQUE;
CREATE PROPERTY `Concept:Resource:SNP`.prefName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Resource:SNP` ( prefName ) NOTUNIQUE;
CREATE PROPERTY `Concept:Resource:SNPEffect`.prefName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Resource:SNPEffect` ( prefName ) NOTUNIQUE;
CREATE PROPERTY `Concept:Resource:Species`.prefName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Resource:Species` ( prefName ) NOTUNIQUE;
CREATE PROPERTY `Concept:Resource:Trait`.prefName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Resource:Trait` ( prefName ) NOTUNIQUE;
CREATE PROPERTY `Concept:Resource:Transport`.prefName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Resource:Transport` ( prefName ) NOTUNIQUE;
CREATE PROPERTY `DataSource:EvidenceType:Resour...`.prefName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `DataSource:EvidenceType:Resour...` ( prefName ) NOTUNIQUE;
CREATE PROPERTY `DataSource:Resource`.prefName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `DataSource:Resource` ( prefName ) NOTUNIQUE;
CREATE PROPERTY `EvidenceType:Resource`.prefName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `EvidenceType:Resource` ( prefName ) NOTUNIQUE;
CREATE PROPERTY `Accession:Resource`.altName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Accession:Resource` ( altName ) NOTUNIQUE;
CREATE PROPERTY `BioProc:Concept:Resource`.altName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `BioProc:Concept:Resource` ( altName ) NOTUNIQUE;
CREATE PROPERTY `CelComp:Concept:Resource`.altName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `CelComp:Concept:Resource` ( altName ) NOTUNIQUE;
CREATE PROPERTY `CoExpCluster:Concept:Resource`.altName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `CoExpCluster:Concept:Resource` ( altName ) NOTUNIQUE;
CREATE PROPERTY `CoExpStudy:Concept:Resource`.altName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `CoExpStudy:Concept:Resource` ( altName ) NOTUNIQUE;
CREATE PROPERTY `Comp:Concept:Resource`.altName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Comp:Concept:Resource` ( altName ) NOTUNIQUE;
CREATE PROPERTY `Concept:EC:Resource`.altName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:EC:Resource` ( altName ) NOTUNIQUE;
CREATE PROPERTY `Concept:Enzyme:Resource`.altName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Enzyme:Resource` ( altName ) NOTUNIQUE;
CREATE PROPERTY `Concept:Gene:Resource`.altName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Gene:Resource` ( altName ) NOTUNIQUE;
CREATE PROPERTY `Concept:MolFunc:Resource`.altName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:MolFunc:Resource` ( altName ) NOTUNIQUE;
CREATE PROPERTY `Concept:Path:Resource`.altName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Path:Resource` ( altName ) NOTUNIQUE;
CREATE PROPERTY `Concept:Phenotype:Resource`.altName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Phenotype:Resource` ( altName ) NOTUNIQUE;
CREATE PROPERTY `Concept:PlantOntologyTerm:Reso...`.altName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:PlantOntologyTerm:Reso...` ( altName ) NOTUNIQUE;
CREATE PROPERTY `Concept:Protcmplx:Resource`.altName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Protcmplx:Resource` ( altName ) NOTUNIQUE;
CREATE PROPERTY `Concept:ProtDomain:Resource`.altName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:ProtDomain:Resource` ( altName ) NOTUNIQUE;
CREATE PROPERTY `Concept:Protein:Resource`.altName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Protein:Resource` ( altName ) NOTUNIQUE;
CREATE PROPERTY `Concept:Publication:Resource`.altName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Publication:Resource` ( altName ) NOTUNIQUE;
CREATE PROPERTY `Concept:Reaction:Resource`.altName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Reaction:Resource` ( altName ) NOTUNIQUE;
CREATE PROPERTY `Concept:Resource:SNP`.altName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Resource:SNP` ( altName ) NOTUNIQUE;
CREATE PROPERTY `Concept:Resource:SNPEffect`.altName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Resource:SNPEffect` ( altName ) NOTUNIQUE;
CREATE PROPERTY `Concept:Resource:Species`.altName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Resource:Species` ( altName ) NOTUNIQUE;
CREATE PROPERTY `Concept:Resource:Trait`.altName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Resource:Trait` ( altName ) NOTUNIQUE;
CREATE PROPERTY `Concept:Resource:Transport`.altName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Resource:Transport` ( altName ) NOTUNIQUE;
CREATE PROPERTY `DataSource:EvidenceType:Resour...`.altName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `DataSource:EvidenceType:Resour...` ( altName ) NOTUNIQUE;
CREATE PROPERTY `DataSource:Resource`.altName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `DataSource:Resource` ( altName ) NOTUNIQUE;
CREATE PROPERTY `EvidenceType:Resource`.altName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `EvidenceType:Resource` ( altName ) NOTUNIQUE;
CREATE PROPERTY `Accession:Resource`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Accession:Resource` ( label ) NOTUNIQUE;
CREATE PROPERTY `BioProc:Concept:Resource`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `BioProc:Concept:Resource` ( label ) NOTUNIQUE;
CREATE PROPERTY `CelComp:Concept:Resource`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `CelComp:Concept:Resource` ( label ) NOTUNIQUE;
CREATE PROPERTY `CoExpCluster:Concept:Resource`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `CoExpCluster:Concept:Resource` ( label ) NOTUNIQUE;
CREATE PROPERTY `CoExpStudy:Concept:Resource`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `CoExpStudy:Concept:Resource` ( label ) NOTUNIQUE;
CREATE PROPERTY `Comp:Concept:Resource`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Comp:Concept:Resource` ( label ) NOTUNIQUE;
CREATE PROPERTY `Concept:EC:Resource`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:EC:Resource` ( label ) NOTUNIQUE;
CREATE PROPERTY `Concept:Enzyme:Resource`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Enzyme:Resource` ( label ) NOTUNIQUE;
CREATE PROPERTY `Concept:Gene:Resource`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Gene:Resource` ( label ) NOTUNIQUE;
CREATE PROPERTY `Concept:MolFunc:Resource`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:MolFunc:Resource` ( label ) NOTUNIQUE;
CREATE PROPERTY `Concept:Path:Resource`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Path:Resource` ( label ) NOTUNIQUE;
CREATE PROPERTY `Concept:Phenotype:Resource`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Phenotype:Resource` ( label ) NOTUNIQUE;
CREATE PROPERTY `Concept:PlantOntologyTerm:Reso...`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:PlantOntologyTerm:Reso...` ( label ) NOTUNIQUE;
CREATE PROPERTY `Concept:Protcmplx:Resource`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Protcmplx:Resource` ( label ) NOTUNIQUE;
CREATE PROPERTY `Concept:ProtDomain:Resource`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:ProtDomain:Resource` ( label ) NOTUNIQUE;
CREATE PROPERTY `Concept:Protein:Resource`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Protein:Resource` ( label ) NOTUNIQUE;
CREATE PROPERTY `Concept:Publication:Resource`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Publication:Resource` ( label ) NOTUNIQUE;
CREATE PROPERTY `Concept:Reaction:Resource`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Reaction:Resource` ( label ) NOTUNIQUE;
CREATE PROPERTY `Concept:Resource:SNP`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Resource:SNP` ( label ) NOTUNIQUE;
CREATE PROPERTY `Concept:Resource:SNPEffect`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Resource:SNPEffect` ( label ) NOTUNIQUE;
CREATE PROPERTY `Concept:Resource:Species`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Resource:Species` ( label ) NOTUNIQUE;
CREATE PROPERTY `Concept:Resource:Trait`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Resource:Trait` ( label ) NOTUNIQUE;
CREATE PROPERTY `Concept:Resource:Transport`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Resource:Transport` ( label ) NOTUNIQUE;
CREATE PROPERTY `DataSource:EvidenceType:Resour...`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `DataSource:EvidenceType:Resour...` ( label ) NOTUNIQUE;
CREATE PROPERTY `DataSource:Resource`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `DataSource:Resource` ( label ) NOTUNIQUE;
CREATE PROPERTY `EvidenceType:Resource`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `EvidenceType:Resource` ( label ) NOTUNIQUE;
CREATE PROPERTY `ac_by`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `ac_by` ( label ) NOTUNIQUE;
CREATE PROPERTY `associated_with`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `associated_with` ( label ) NOTUNIQUE;
CREATE PROPERTY `ca_by`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `ca_by` ( label ) NOTUNIQUE;
CREATE PROPERTY `cat_c`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `cat_c` ( label ) NOTUNIQUE;
CREATE PROPERTY `cooc_wi`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `cooc_wi` ( label ) NOTUNIQUE;
CREATE PROPERTY `cs_by`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `cs_by` ( label ) NOTUNIQUE;
CREATE PROPERTY `dataSource`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `dataSource` ( label ) NOTUNIQUE;
CREATE PROPERTY `enc`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `enc` ( label ) NOTUNIQUE;
CREATE PROPERTY `enriched_for`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `enriched_for` ( label ) NOTUNIQUE;
CREATE PROPERTY `equ`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `equ` ( label ) NOTUNIQUE;
CREATE PROPERTY `equivalent`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `equivalent` ( label ) NOTUNIQUE;
CREATE PROPERTY `evidence`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `evidence` ( label ) NOTUNIQUE;
CREATE PROPERTY `genetic`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `genetic` ( label ) NOTUNIQUE;
CREATE PROPERTY `h_s_s`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `h_s_s` ( label ) NOTUNIQUE;
CREATE PROPERTY `has_domain`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `has_domain` ( label ) NOTUNIQUE;
CREATE PROPERTY `has_function`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `has_function` ( label ) NOTUNIQUE;
CREATE PROPERTY `has_mutant`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `has_mutant` ( label ) NOTUNIQUE;
CREATE PROPERTY `has_phenotype`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `has_phenotype` ( label ) NOTUNIQUE;
CREATE PROPERTY `has_variation`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `has_variation` ( label ) NOTUNIQUE;
CREATE PROPERTY `homoeolog`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `homoeolog` ( label ) NOTUNIQUE;
CREATE PROPERTY `identifier`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `identifier` ( label ) NOTUNIQUE;
CREATE PROPERTY `in_by`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `in_by` ( label ) NOTUNIQUE;
CREATE PROPERTY `is_a`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `is_a` ( label ) NOTUNIQUE;
CREATE PROPERTY `is_part_of`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `is_part_of` ( label ) NOTUNIQUE;
CREATE PROPERTY `leads_to`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `leads_to` ( label ) NOTUNIQUE;
CREATE PROPERTY `located_in`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `located_in` ( label ) NOTUNIQUE;
CREATE PROPERTY `neg_reg`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `neg_reg` ( label ) NOTUNIQUE;
CREATE PROPERTY `not_function`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `not_function` ( label ) NOTUNIQUE;
CREATE PROPERTY `not_located_in`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `not_located_in` ( label ) NOTUNIQUE;
CREATE PROPERTY `occ_in`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `occ_in` ( label ) NOTUNIQUE;
CREATE PROPERTY `ortho`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `ortho` ( label ) NOTUNIQUE;
CREATE PROPERTY `para`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `para` ( label ) NOTUNIQUE;
CREATE PROPERTY `part_of`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `part_of` ( label ) NOTUNIQUE;
CREATE PROPERTY `participates_in`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `participates_in` ( label ) NOTUNIQUE;
CREATE PROPERTY `participates_not`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `participates_not` ( label ) NOTUNIQUE;
CREATE PROPERTY `pd_by`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `pd_by` ( label ) NOTUNIQUE;
CREATE PROPERTY `physical`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `physical` ( label ) NOTUNIQUE;
CREATE PROPERTY `pos_reg`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `pos_reg` ( label ) NOTUNIQUE;
CREATE PROPERTY `pub_in`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `pub_in` ( label ) NOTUNIQUE;
CREATE PROPERTY `regulates`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `regulates` ( label ) NOTUNIQUE;
CREATE PROPERTY `relatedConcept`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `relatedConcept` ( label ) NOTUNIQUE;
CREATE PROPERTY `xref`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `xref` ( label ) NOTUNIQUE;
CREATE PROPERTY `ac_by`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `ac_by` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `associated_with`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `associated_with` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `ca_by`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `ca_by` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `cat_c`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `cat_c` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `cooc_wi`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `cooc_wi` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `cs_by`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `cs_by` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `dataSource`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `dataSource` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `enc`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `enc` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `enriched_for`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `enriched_for` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `equ`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `equ` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `equivalent`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `equivalent` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `evidence`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `evidence` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `genetic`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `genetic` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `h_s_s`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `h_s_s` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `has_domain`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `has_domain` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `has_function`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `has_function` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `has_mutant`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `has_mutant` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `has_phenotype`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `has_phenotype` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `has_variation`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `has_variation` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `homoeolog`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `homoeolog` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `identifier`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `identifier` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `in_by`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `in_by` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `is_a`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `is_a` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `is_part_of`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `is_part_of` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `leads_to`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `leads_to` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `located_in`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `located_in` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `neg_reg`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `neg_reg` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `not_function`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `not_function` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `not_located_in`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `not_located_in` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `occ_in`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `occ_in` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `ortho`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `ortho` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `para`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `para` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `part_of`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `part_of` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `participates_in`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `participates_in` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `participates_not`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `participates_not` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `pd_by`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `pd_by` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `physical`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `physical` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `pos_reg`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `pos_reg` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `pub_in`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `pub_in` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `regulates`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `regulates` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `relatedConcept`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `relatedConcept` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `xref`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `xref` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `Accession:Resource`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Accession:Resource` ( iri ) NOTUNIQUE;
CREATE PROPERTY `BioProc:Concept:Resource`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `BioProc:Concept:Resource` ( iri ) NOTUNIQUE;
CREATE PROPERTY `CelComp:Concept:Resource`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `CelComp:Concept:Resource` ( iri ) NOTUNIQUE;
CREATE PROPERTY `CoExpCluster:Concept:Resource`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `CoExpCluster:Concept:Resource` ( iri ) NOTUNIQUE;
CREATE PROPERTY `CoExpStudy:Concept:Resource`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `CoExpStudy:Concept:Resource` ( iri ) NOTUNIQUE;
CREATE PROPERTY `Comp:Concept:Resource`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Comp:Concept:Resource` ( iri ) NOTUNIQUE;
CREATE PROPERTY `Concept:EC:Resource`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:EC:Resource` ( iri ) NOTUNIQUE;
CREATE PROPERTY `Concept:Enzyme:Resource`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Enzyme:Resource` ( iri ) NOTUNIQUE;
CREATE PROPERTY `Concept:Gene:Resource`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Gene:Resource` ( iri ) NOTUNIQUE;
CREATE PROPERTY `Concept:MolFunc:Resource`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:MolFunc:Resource` ( iri ) NOTUNIQUE;
CREATE PROPERTY `Concept:Path:Resource`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Path:Resource` ( iri ) NOTUNIQUE;
CREATE PROPERTY `Concept:Phenotype:Resource`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Phenotype:Resource` ( iri ) NOTUNIQUE;
CREATE PROPERTY `Concept:PlantOntologyTerm:Reso...`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:PlantOntologyTerm:Reso...` ( iri ) NOTUNIQUE;
CREATE PROPERTY `Concept:Protcmplx:Resource`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Protcmplx:Resource` ( iri ) NOTUNIQUE;
CREATE PROPERTY `Concept:ProtDomain:Resource`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:ProtDomain:Resource` ( iri ) NOTUNIQUE;
CREATE PROPERTY `Concept:Protein:Resource`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Protein:Resource` ( iri ) NOTUNIQUE;
CREATE PROPERTY `Concept:Publication:Resource`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Publication:Resource` ( iri ) NOTUNIQUE;
CREATE PROPERTY `Concept:Reaction:Resource`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Reaction:Resource` ( iri ) NOTUNIQUE;
CREATE PROPERTY `Concept:Resource:SNP`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Resource:SNP` ( iri ) NOTUNIQUE;
CREATE PROPERTY `Concept:Resource:SNPEffect`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Resource:SNPEffect` ( iri ) NOTUNIQUE;
CREATE PROPERTY `Concept:Resource:Species`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Resource:Species` ( iri ) NOTUNIQUE;
CREATE PROPERTY `Concept:Resource:Trait`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Resource:Trait` ( iri ) NOTUNIQUE;
CREATE PROPERTY `Concept:Resource:Transport`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Resource:Transport` ( iri ) NOTUNIQUE;
CREATE PROPERTY `DataSource:EvidenceType:Resour...`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `DataSource:EvidenceType:Resour...` ( iri ) NOTUNIQUE;
CREATE PROPERTY `DataSource:Resource`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `DataSource:Resource` ( iri ) NOTUNIQUE;
CREATE PROPERTY `EvidenceType:Resource`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `EvidenceType:Resource` ( iri ) NOTUNIQUE;
CREATE PROPERTY `ac_by`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `ac_by` ( iri ) NOTUNIQUE;
CREATE PROPERTY `associated_with`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `associated_with` ( iri ) NOTUNIQUE;
CREATE PROPERTY `ca_by`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `ca_by` ( iri ) NOTUNIQUE;
CREATE PROPERTY `cat_c`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `cat_c` ( iri ) NOTUNIQUE;
CREATE PROPERTY `cooc_wi`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `cooc_wi` ( iri ) NOTUNIQUE;
CREATE PROPERTY `cs_by`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `cs_by` ( iri ) NOTUNIQUE;
CREATE PROPERTY `dataSource`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `dataSource` ( iri ) NOTUNIQUE;
CREATE PROPERTY `enc`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `enc` ( iri ) NOTUNIQUE;
CREATE PROPERTY `enriched_for`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `enriched_for` ( iri ) NOTUNIQUE;
CREATE PROPERTY `equ`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `equ` ( iri ) NOTUNIQUE;
CREATE PROPERTY `equivalent`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `equivalent` ( iri ) NOTUNIQUE;
CREATE PROPERTY `evidence`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `evidence` ( iri ) NOTUNIQUE;
CREATE PROPERTY `genetic`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `genetic` ( iri ) NOTUNIQUE;
CREATE PROPERTY `h_s_s`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `h_s_s` ( iri ) NOTUNIQUE;
CREATE PROPERTY `has_domain`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `has_domain` ( iri ) NOTUNIQUE;
CREATE PROPERTY `has_function`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `has_function` ( iri ) NOTUNIQUE;
CREATE PROPERTY `has_mutant`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `has_mutant` ( iri ) NOTUNIQUE;
CREATE PROPERTY `has_phenotype`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `has_phenotype` ( iri ) NOTUNIQUE;
CREATE PROPERTY `has_variation`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `has_variation` ( iri ) NOTUNIQUE;
CREATE PROPERTY `homoeolog`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `homoeolog` ( iri ) NOTUNIQUE;
CREATE PROPERTY `identifier`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `identifier` ( iri ) NOTUNIQUE;
CREATE PROPERTY `in_by`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `in_by` ( iri ) NOTUNIQUE;
CREATE PROPERTY `is_a`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `is_a` ( iri ) NOTUNIQUE;
CREATE PROPERTY `is_part_of`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `is_part_of` ( iri ) NOTUNIQUE;
CREATE PROPERTY `leads_to`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `leads_to` ( iri ) NOTUNIQUE;
CREATE PROPERTY `located_in`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `located_in` ( iri ) NOTUNIQUE;
CREATE PROPERTY `neg_reg`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `neg_reg` ( iri ) NOTUNIQUE;
CREATE PROPERTY `not_function`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `not_function` ( iri ) NOTUNIQUE;
CREATE PROPERTY `not_located_in`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `not_located_in` ( iri ) NOTUNIQUE;
CREATE PROPERTY `occ_in`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `occ_in` ( iri ) NOTUNIQUE;
CREATE PROPERTY `ortho`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `ortho` ( iri ) NOTUNIQUE;
CREATE PROPERTY `para`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `para` ( iri ) NOTUNIQUE;
CREATE PROPERTY `part_of`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `part_of` ( iri ) NOTUNIQUE;
CREATE PROPERTY `participates_in`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `participates_in` ( iri ) NOTUNIQUE;
CREATE PROPERTY `participates_not`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `participates_not` ( iri ) NOTUNIQUE;
CREATE PROPERTY `pd_by`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `pd_by` ( iri ) NOTUNIQUE;
CREATE PROPERTY `physical`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `physical` ( iri ) NOTUNIQUE;
CREATE PROPERTY `pos_reg`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `pos_reg` ( iri ) NOTUNIQUE;
CREATE PROPERTY `pub_in`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `pub_in` ( iri ) NOTUNIQUE;
CREATE PROPERTY `regulates`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `regulates` ( iri ) NOTUNIQUE;
CREATE PROPERTY `relatedConcept`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `relatedConcept` ( iri ) NOTUNIQUE;
CREATE PROPERTY `xref`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `xref` ( iri ) NOTUNIQUE;
COMMIT;
