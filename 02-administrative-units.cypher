MATCH (c:City)-[:IN]->(co:Country)
WITH c, co
MERGE (ar:AdministrativeRegion { name: c.adminName })
MERGE (c)-[:IN { role: c.capital }]->(ar)
MERGE (ar)-[:IN]->(co)
RETURN count(ar) as AdministrativeRegionsLoaded;