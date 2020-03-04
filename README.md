# COVID-19 Graph

Using a forked copy of Johns Hopkins data to load trends on COVID-19 infections into Neo4j

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




