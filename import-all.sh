#!/bin/bash

DEFAULT_ENDPOINT=bolt://localhost:7687
ENDPOINT=${NEO4J_URI:-$DEFAULT_ENDPOINT}
USERNAME=${NEO4J_USERNAME:-neo4j}
PASSWORD=${NEO4J_PASSWORD:-admin}

cypher_shell="/Users/davidallen/Library/Application Support/Neo4j Desktop/Application/neo4jDatabases/database-8bf32f49-6a41-4b02-843e-dbdb50de760d/installation-4.0.1/bin/cypher-shell"

function run_cypher {
    echo "Running $1"
    echo "$1" | "$cypher_shell" -u "$USERNAME" -a "$ENDPOINT" -p "$PASSWORD"
}

# Set up the database.
run_cypher "00-indexes.cypher"
run_cypher "01-load-world-cities.cypher"
run_cypher "02-administrative-units.cypher"
run_cypher "03-country-bounding-boxes.cypher"

# Load each date of COVID data.
for file in `cat files-to-load.list` ; do
 export file=$file
 echo "Loading COVID stats for $file"
 cat 04-covid19.cypher | envsubst | "$cypher_shell" -a $ENDPOINT -u $USERNAME -p $PASSWORD

 if [ $? -ne 0 ] ; then
    exit 1
 fi
done
