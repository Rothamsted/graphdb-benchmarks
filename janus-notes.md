* Starting the server via Docker

```bash
docker run --rm --name janus --volume /tmp/janus:/var/lib/janusgraph/data  janusgraph/janusgraph:latest
```

Default uses Berkeley on the mentioned volume

* Starting the client
```bash
docker run --rm --link janus:janusgraph -e GREMLIN_REMOTE_HOSTS=janusgraph -it janusgraph/janusgraph:latest ./bin/gremlin.sh
```

`--link` runs it in the same container. `janusgraph` is used for connection:

```groovy
g = traversal().withRemote('conf/remote-graph.properties')
g.addV('person').property('name', 'chris')
``` 

* The [Docker docs](https://github.com/JanusGraph/janusgraph-docker/blob/master/README.md) 

