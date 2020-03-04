# COVID-19 Graph

Using a forked copy of Johns Hopkins data to load trends on COVID-19 infections into Neo4j.

This repo contains cypher scripts and shell scripts to import the data into Neo4j, which is a very
small dataset at this point.

The original forked JHU data in raw CSV form [can be found here](https://github.com/moxious/COVID-19/)

## Resulting Graph Shape

Simplified representation of what kind of data you end up with:

```
(:Region)<-[:IN]-(:Province)-[:REPORTED]->(:Report { confirmed, deaths, recovered, latitude, longitude, lastUpdate, reportDate }),
(:Report)-[:NEARBY]->(:City)-[:IN]->(:Country),
(:Region)-[:IS]->(:Country)
(:Province)-[:IS]->(:City)
```

## Requirements to Use This

* This repo assumes Neo4j 4.0!  There were some subtle changes to cypher, things like toInt -> toInteger,
and the load scripts probably won't run on 3.5
* You need APOC installed.

Nothing else

## Usage

Check the `import-all.sh` script.  Adjust particulars for your situation, and then run it to re-create a database
from scratch.

```
./import-all.sh
```

This is a fast moving situation.  

I've pointed this at a forked copy of the JHU data so that it can't go missing,
but this necessitates keeping the fork in sync.

See "files-to-load.list" for a list of dated report files that will be loaded.  This must
be maintained to some extent as new data comes in.




