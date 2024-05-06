MATCH {type: `Concept:Protein:Resource`, as: p}
 .outE('is_part_of'){as: e}.inV(){type: `Concept:Protcmplx:Resource`, as: cpx}
RETURN p.prefName, cpx.prefName, e.evidence
LIMIT 100