:remote connect tinkerpop.server conf/remote.yaml session 
:remote console 
g.io('/mnt/c/Users/cbobed/workingDir/datasets/rdf2pg_paper/wheat.graphml').with(IO.reader, IO.graphml).read().iterate()
:exit
