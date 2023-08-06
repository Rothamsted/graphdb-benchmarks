CALL { 
  MATCH (prot:Protein) - [:is_a|ac_by] - (enz:Enzyme)

  CALL {
    WITH enz
    MATCH (enz) - [:ac_by|in_by] -> (cmp:Comp)
      - [:cs_by|pd_by] -> (trn:Transport)
    RETURN trn, "enz/cmp/trn" AS branch
    
    UNION
    
    WITH enz
    MATCH (enz) <- [:ca_by] - (trn:Transport) 
    RETURN trn, "enz/trn" AS branch
  }
  MATCH (trn) - [:part_of] -> (pw:Path)
  RETURN prot, pw, branch
  
  UNION
  
  MATCH (prot:Protein) - [:pd_by|cs_by] -> (react:Reaction)
    - [:part_of] -> (pw:Path)
  RETURN prot, pw, "react" AS branch
}
RETURN prot.prefName, pw.prefName, branch, rand()
ORDER BY rand()
LIMIT 100
