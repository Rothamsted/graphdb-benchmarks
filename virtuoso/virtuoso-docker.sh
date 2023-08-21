set -e
cd `dirname "$0"`

db="$1"

if [[ -z "$db" ]] || [[ "$db" == "-h" ]]; then
cat <<EOT
  
  
  $0 biopax|ara|poaceae

Directories:

  `pwd`/virtuoso-db-<dataset> server dir (re-use the .ini in virtuoso-db-biopax
  `pwd`/rdf-<dataset> RDF source
  
You can load data via virtuoso-utils (https://github.com/marco-brandizi/rdfutils), with these commands:

# Tell Virtuoso Utils it needs to use the Docker container
export VIRTUOSO_DOCKER_ENABLED=true

# /data-src is where your rdf-<dataset> is mapped on the container
<virtuoso-utils>/virt_load.sh /data-src http://knetminer.org/data/rdf/resources/graphs/test

EOT
  exit 1
fi

docker run \
    --name virtuoso \
    --interactive \
    --tty \
    --detach \
    --env DBA_PASSWORD=dba \
    --publish 1111:1111 \
    --publish  8890:8890 \
    --volume `pwd`/virtuoso-db-$db:/database \
    --volume `pwd`/rdf-$db:/data-src \
    --memory 32g \
    openlink/virtuoso-opensource-7:7.2.10-r16-gcf64774-ubuntu
