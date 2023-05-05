:remote connect tinkerpop.server conf/remote.yaml session 
:remote console 

conf = new BaseConfiguration()
conf.setProperty('gremlin.tinkergraph.vertexIdManager', 'ANY')
conf.setProperty('gremlin.tinkergraph.edgeIdManager','ANY')
conf.setProperty('gremlin.tinkergraph.vertexPropertyIdManager','ANY')

graph2 = TinkerGraph.open(conf)

graph2.createIndex('iri', Vertex.class)
graph2.createIndex('iri', Edge.class)

graph2.createIndex('labelV-idx', Vertex.class)
graph2.createIndex('labelE-idx', Edge.class)

graph2.createIndex('identifier', Vertex.class)
graph2.createIndex('prefName', Vertex.class)

graph2.createIndex('altName', Vertex.class)
graph2.createIndex('knetLabel', Vertex.class)
 
graph2.createIndex('description', Vertex.class) 

g2 = traversal().withEmbedded(graph2)
