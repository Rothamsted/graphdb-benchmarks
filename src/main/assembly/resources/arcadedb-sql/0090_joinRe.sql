MATCH {type: `Concept:Protein:Resource`, as: p, where: (prefName matches "(?i).*$protWord.*" )}
 .out('is_part_of'){type: `Concept:Protcmplx:Resource`, as: cpx1}
 .out('is_part_of'){type: `Concept:Protcmplx:Resource`, as: cpx2}
RETURN p.prefName, cpx1.prefName, cpx2.prefName
LIMIT 100

