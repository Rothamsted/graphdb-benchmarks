* Starting the server via Docker

```bash
docker run --rm --name janus -p 8182:8182 \
  --volume /tmp/janus:/var/lib/janusgraph/data \
  --volume `pwd`/janus/janus-docker-conf:/opt/janusgraph/conf \
  janusgraph/janusgraph
```

Default uses Berkeley on the mentioned volume


* Starting the client

```bash
# -e not needed when connecting conf/docker-host-remote.yaml
docker run --rm --link janus:janusgraph -e GREMLIN_REMOTE_HOSTS=janusgraph -it janusgraph/janusgraph ./bin/gremlin.sh
```

`--link` runs it in the same container. `janusgraph` is used for connection:

* Connection

```groovy
:remote connect tinkerpop.server conf/remote.yaml
# Or this for testing that it is reachable from the outside 
# :remote connect tinkerpop.server conf/docker-host-remote.yaml
:remote console
g.addV('person').property('name', 'chris')
g.V()
```


* Loading from graphml

```groovy
graph.io(graphml()).readGraph('/var/lib/janusgraph/data/test.graphml')
// old version g.io ( "/var/lib/janusgraph/data/test.xml" ).read ().iterate ()
```

* Dropping a graph:
```groovy
g.V().drop().iterate()
```

## Docs

* The [Docker docs](https://github.com/JanusGraph/janusgraph-docker/blob/master/README.md) 
* [Basic usage](https://docs.janusgraph.org/getting-started/basic-usage/#loading-with-an-index-backend)
* [Gremlin book](https://kelvinlawrence.net/book/PracticalGremlin.html)

