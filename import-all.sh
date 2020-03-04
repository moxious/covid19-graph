#!/bin/bash

ENDPOINT=bolt://localhost
USERNAME=neo4j
PASSWORD=admin

cypher="/Users/davidallen/Library/Application Support/Neo4j Desktop/Application/neo4jDatabases/database-8bf32f49-6a41-4b02-843e-dbdb50de760d/installation-4.0.1/bin/cypher-shell"



# Load each date.
for dt in  "03-03-2020" "03-02-2020" "03-01-2020" "02-29-2020" ; do
 export report_date=$dt
 echo "Loading $file"
 cat 04-covid19.cypher | envsubst | "$cypher" -a $ENDPOINT -u $USERNAME -p $PASSWORD

 if [ $? -ne 0 ] ; then
    exit 1
 fi
done
