CREATE PROPERTY `Accession:Resource`.identifier IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Accession:Resource` ( identifier ) NOTUNIQUE;
CREATE PROPERTY `BioProc:Concept:Resource`.identifier IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `BioProc:Concept:Resource` ( identifier ) NOTUNIQUE;
CREATE PROPERTY `CelComp:Concept:Resource`.identifier IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `CelComp:Concept:Resource` ( identifier ) NOTUNIQUE;
CREATE PROPERTY `Comp:Concept:Resource`.identifier IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Comp:Concept:Resource` ( identifier ) NOTUNIQUE;
CREATE PROPERTY `Concept:EC:Resource`.identifier IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:EC:Resource` ( identifier ) NOTUNIQUE;
CREATE PROPERTY `Concept:Enzyme:Resource`.identifier IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Enzyme:Resource` ( identifier ) NOTUNIQUE;
CREATE PROPERTY `Concept:MolFunc:Resource`.identifier IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:MolFunc:Resource` ( identifier ) NOTUNIQUE;
CREATE PROPERTY `Concept:Path:Resource`.identifier IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Path:Resource` ( identifier ) NOTUNIQUE;
CREATE PROPERTY `Concept:Protcmplx:Resource`.identifier IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Protcmplx:Resource` ( identifier ) NOTUNIQUE;
CREATE PROPERTY `Concept:Protein:Resource`.identifier IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Protein:Resource` ( identifier ) NOTUNIQUE;
CREATE PROPERTY `Concept:Publication:Resource`.identifier IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Publication:Resource` ( identifier ) NOTUNIQUE;
CREATE PROPERTY `Concept:Reaction:Resource`.identifier IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Reaction:Resource` ( identifier ) NOTUNIQUE;
CREATE PROPERTY `Concept:Resource:Transport`.identifier IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Resource:Transport` ( identifier ) NOTUNIQUE;
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
CREATE PROPERTY `Comp:Concept:Resource`.prefName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Comp:Concept:Resource` ( prefName ) NOTUNIQUE;
CREATE PROPERTY `Concept:EC:Resource`.prefName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:EC:Resource` ( prefName ) NOTUNIQUE;
CREATE PROPERTY `Concept:Enzyme:Resource`.prefName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Enzyme:Resource` ( prefName ) NOTUNIQUE;
CREATE PROPERTY `Concept:MolFunc:Resource`.prefName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:MolFunc:Resource` ( prefName ) NOTUNIQUE;
CREATE PROPERTY `Concept:Path:Resource`.prefName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Path:Resource` ( prefName ) NOTUNIQUE;
CREATE PROPERTY `Concept:Protcmplx:Resource`.prefName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Protcmplx:Resource` ( prefName ) NOTUNIQUE;
CREATE PROPERTY `Concept:Protein:Resource`.prefName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Protein:Resource` ( prefName ) NOTUNIQUE;
CREATE PROPERTY `Concept:Publication:Resource`.prefName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Publication:Resource` ( prefName ) NOTUNIQUE;
CREATE PROPERTY `Concept:Reaction:Resource`.prefName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Reaction:Resource` ( prefName ) NOTUNIQUE;
CREATE PROPERTY `Concept:Resource:Transport`.prefName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Resource:Transport` ( prefName ) NOTUNIQUE;
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
CREATE PROPERTY `Comp:Concept:Resource`.altName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Comp:Concept:Resource` ( altName ) NOTUNIQUE;
CREATE PROPERTY `Concept:EC:Resource`.altName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:EC:Resource` ( altName ) NOTUNIQUE;
CREATE PROPERTY `Concept:Enzyme:Resource`.altName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Enzyme:Resource` ( altName ) NOTUNIQUE;
CREATE PROPERTY `Concept:MolFunc:Resource`.altName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:MolFunc:Resource` ( altName ) NOTUNIQUE;
CREATE PROPERTY `Concept:Path:Resource`.altName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Path:Resource` ( altName ) NOTUNIQUE;
CREATE PROPERTY `Concept:Protcmplx:Resource`.altName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Protcmplx:Resource` ( altName ) NOTUNIQUE;
CREATE PROPERTY `Concept:Protein:Resource`.altName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Protein:Resource` ( altName ) NOTUNIQUE;
CREATE PROPERTY `Concept:Publication:Resource`.altName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Publication:Resource` ( altName ) NOTUNIQUE;
CREATE PROPERTY `Concept:Reaction:Resource`.altName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Reaction:Resource` ( altName ) NOTUNIQUE;
CREATE PROPERTY `Concept:Resource:Transport`.altName IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Resource:Transport` ( altName ) NOTUNIQUE;
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
CREATE PROPERTY `Comp:Concept:Resource`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Comp:Concept:Resource` ( label ) NOTUNIQUE;
CREATE PROPERTY `Concept:EC:Resource`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:EC:Resource` ( label ) NOTUNIQUE;
CREATE PROPERTY `Concept:Enzyme:Resource`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Enzyme:Resource` ( label ) NOTUNIQUE;
CREATE PROPERTY `Concept:MolFunc:Resource`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:MolFunc:Resource` ( label ) NOTUNIQUE;
CREATE PROPERTY `Concept:Path:Resource`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Path:Resource` ( label ) NOTUNIQUE;
CREATE PROPERTY `Concept:Protcmplx:Resource`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Protcmplx:Resource` ( label ) NOTUNIQUE;
CREATE PROPERTY `Concept:Protein:Resource`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Protein:Resource` ( label ) NOTUNIQUE;
CREATE PROPERTY `Concept:Publication:Resource`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Publication:Resource` ( label ) NOTUNIQUE;
CREATE PROPERTY `Concept:Reaction:Resource`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Reaction:Resource` ( label ) NOTUNIQUE;
CREATE PROPERTY `Concept:Resource:Transport`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Resource:Transport` ( label ) NOTUNIQUE;
CREATE PROPERTY `DataSource:Resource`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `DataSource:Resource` ( label ) NOTUNIQUE;
CREATE PROPERTY `EvidenceType:Resource`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `EvidenceType:Resource` ( label ) NOTUNIQUE;
CREATE PROPERTY `ac_by`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `ac_by` ( label ) NOTUNIQUE;
CREATE PROPERTY `ca_by`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `ca_by` ( label ) NOTUNIQUE;
CREATE PROPERTY `cat_c`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `cat_c` ( label ) NOTUNIQUE;
CREATE PROPERTY `cs_by`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `cs_by` ( label ) NOTUNIQUE;
CREATE PROPERTY `dataSource`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `dataSource` ( label ) NOTUNIQUE;
CREATE PROPERTY `evidence`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `evidence` ( label ) NOTUNIQUE;
CREATE PROPERTY `identifier`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `identifier` ( label ) NOTUNIQUE;
CREATE PROPERTY `in_by`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `in_by` ( label ) NOTUNIQUE;
CREATE PROPERTY `is_a`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `is_a` ( label ) NOTUNIQUE;
CREATE PROPERTY `is_part_of`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `is_part_of` ( label ) NOTUNIQUE;
CREATE PROPERTY `neg_reg`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `neg_reg` ( label ) NOTUNIQUE;
CREATE PROPERTY `part_of`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `part_of` ( label ) NOTUNIQUE;
CREATE PROPERTY `pd_by`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `pd_by` ( label ) NOTUNIQUE;
CREATE PROPERTY `pos_reg`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `pos_reg` ( label ) NOTUNIQUE;
CREATE PROPERTY `pub_in`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `pub_in` ( label ) NOTUNIQUE;
CREATE PROPERTY `regulates`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `regulates` ( label ) NOTUNIQUE;
CREATE PROPERTY `relatedConcept`.label IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `relatedConcept` ( label ) NOTUNIQUE;
CREATE PROPERTY `ac_by`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `ac_by` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `ca_by`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `ca_by` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `cat_c`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `cat_c` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `cs_by`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `cs_by` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `dataSource`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `dataSource` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `evidence`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `evidence` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `identifier`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `identifier` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `in_by`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `in_by` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `is_a`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `is_a` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `is_part_of`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `is_part_of` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `neg_reg`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `neg_reg` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `part_of`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `part_of` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `pd_by`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `pd_by` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `pos_reg`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `pos_reg` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `pub_in`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `pub_in` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `regulates`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `regulates` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `relatedConcept`.evidence IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `relatedConcept` ( evidence ) NOTUNIQUE;
CREATE PROPERTY `Publication`.AbstractHeader IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Publication` ( AbstractHeader ) NOTUNIQUE;
CREATE PROPERTY `Publication`.AUTHORS IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Publication` ( AUTHORS ) NOTUNIQUE;
CREATE PROPERTY `Publication`.JOURNAL_REF IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Publication` ( JOURNAL_REF ) NOTUNIQUE;
CREATE PROPERTY `Accession:Resource`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Accession:Resource` ( iri ) NOTUNIQUE;
CREATE PROPERTY `BioProc:Concept:Resource`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `BioProc:Concept:Resource` ( iri ) NOTUNIQUE;
CREATE PROPERTY `CelComp:Concept:Resource`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `CelComp:Concept:Resource` ( iri ) NOTUNIQUE;
CREATE PROPERTY `Comp:Concept:Resource`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Comp:Concept:Resource` ( iri ) NOTUNIQUE;
CREATE PROPERTY `Concept:EC:Resource`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:EC:Resource` ( iri ) NOTUNIQUE;
CREATE PROPERTY `Concept:Enzyme:Resource`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Enzyme:Resource` ( iri ) NOTUNIQUE;
CREATE PROPERTY `Concept:MolFunc:Resource`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:MolFunc:Resource` ( iri ) NOTUNIQUE;
CREATE PROPERTY `Concept:Path:Resource`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Path:Resource` ( iri ) NOTUNIQUE;
CREATE PROPERTY `Concept:Protcmplx:Resource`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Protcmplx:Resource` ( iri ) NOTUNIQUE;
CREATE PROPERTY `Concept:Protein:Resource`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Protein:Resource` ( iri ) NOTUNIQUE;
CREATE PROPERTY `Concept:Publication:Resource`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Publication:Resource` ( iri ) NOTUNIQUE;
CREATE PROPERTY `Concept:Reaction:Resource`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Reaction:Resource` ( iri ) NOTUNIQUE;
CREATE PROPERTY `Concept:Resource:Transport`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `Concept:Resource:Transport` ( iri ) NOTUNIQUE;
CREATE PROPERTY `DataSource:Resource`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `DataSource:Resource` ( iri ) NOTUNIQUE;
CREATE PROPERTY `EvidenceType:Resource`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `EvidenceType:Resource` ( iri ) NOTUNIQUE;
CREATE PROPERTY `ac_by`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `ac_by` ( iri ) NOTUNIQUE;
CREATE PROPERTY `ca_by`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `ca_by` ( iri ) NOTUNIQUE;
CREATE PROPERTY `cat_c`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `cat_c` ( iri ) NOTUNIQUE;
CREATE PROPERTY `cs_by`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `cs_by` ( iri ) NOTUNIQUE;
CREATE PROPERTY `dataSource`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `dataSource` ( iri ) NOTUNIQUE;
CREATE PROPERTY `evidence`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `evidence` ( iri ) NOTUNIQUE;
CREATE PROPERTY `identifier`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `identifier` ( iri ) NOTUNIQUE;
CREATE PROPERTY `in_by`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `in_by` ( iri ) NOTUNIQUE;
CREATE PROPERTY `is_a`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `is_a` ( iri ) NOTUNIQUE;
CREATE PROPERTY `is_part_of`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `is_part_of` ( iri ) NOTUNIQUE;
CREATE PROPERTY `neg_reg`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `neg_reg` ( iri ) NOTUNIQUE;
CREATE PROPERTY `part_of`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `part_of` ( iri ) NOTUNIQUE;
CREATE PROPERTY `pd_by`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `pd_by` ( iri ) NOTUNIQUE;
CREATE PROPERTY `pos_reg`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `pos_reg` ( iri ) NOTUNIQUE;
CREATE PROPERTY `pub_in`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `pub_in` ( iri ) NOTUNIQUE;
CREATE PROPERTY `regulates`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `regulates` ( iri ) NOTUNIQUE;
CREATE PROPERTY `relatedConcept`.iri IF NOT EXISTS STRING;
CREATE INDEX IF NOT EXISTS ON `relatedConcept` ( iri ) NOTUNIQUE;