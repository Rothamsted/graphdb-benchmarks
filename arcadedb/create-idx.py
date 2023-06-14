# Creates AracdeDB indexing instructions, starting from the TSV returned by rdf2graphml
# 

import csv
import sys

# Idx definitions, as produced by rdf2pg
idx_defs_path = sys.argv [ 1 ]
# List of all nodes. TODO: get them via SQL
all_nodes_path = sys.argv [ 2 ]
# List of all labels. TODO: get them via SQL
all_rels_path = sys.argv [ 3 ]

def read_tsv ( path ):
  with open ( path, newline = '' ) as tsvf:
    return list ( csv.reader ( tsvf, delimiter = '\t' ) )

all_nodes = read_tsv ( all_nodes_path )
all_nodes = [ n [ 0 ] for n in all_nodes ]

all_rels = read_tsv ( all_rels_path )
all_rels = [ r [ 0 ] for r in all_rels ]

idx_defs = read_tsv ( idx_defs_path )
del idx_defs [ 0 ]

for (type, prop, is_rel) in idx_defs:
  if prop == '_type_':
    # index on label or rel type, not supported
    continue

  is_rel = is_rel == 'true'

  types = [ type ]
  if type == '*':
    types = all_rels if is_rel else all_nodes
  
  for itype in types:
    # print ( f"CREATE {'EDGE' if is_rel else 'VERTEX'} TYPE `Publication` IF NOT EXISTS;" )

    print ( f"CREATE PROPERTY `{itype}`.{prop} IF NOT EXISTS STRING;" )
    #print ( f"CREATE INDEX `{itype}_{prop}{'_r' if is_rel else ''}` ON `{itype}` ( {prop} ) NOTUNIQUE" )
    print ( f"CREATE INDEX IF NOT EXISTS ON `{itype}` ( {prop} ) NOTUNIQUE;" )
    