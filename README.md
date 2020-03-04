# COVID-19 Graph

Using a forked copy of Johns Hopkins data to load trends on COVID-19 infections into Neo4j

## Usage

Check the `import-all.sh` script.  Adjust particulars for your situation, and then run it to re-create a database
from scratch.

```
./import-all.sh
```

This is a fast moving situation, so make sure to check the dates in import-all of the list of dates that
you want to import.  I've pointed this at a forked copy of the JHU data so that it can't go missing,
but this necessitates keeping the fork in sync.



