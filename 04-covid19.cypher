USING PERIODIC COMMIT
LOAD CSV WITH HEADERS
FROM 'https://raw.githubusercontent.com/moxious/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/$report_date.csv' AS line

WITH coalesce(line.`Province/State`, 'General') as province,
     coalesce(line.`Country/Region`, 'Missing') as region,
     line.`Last Update` as lastUpdate,
     line

MERGE (p:Province { name: province })
MERGE (r:Region { name: region })
CREATE (s:Statistic {
    label: region + ' ' + line.Confirmed + ' CONFIRMED ' + line.Deaths + ' Deaths ' + line.Recovered + ' Recovered',
    lastUpdate: datetime(lastUpdate),
    confirmed: toInteger(coalesce(line.Confirmed, 0)),
    deaths: toInteger(coalesce(line.Deaths, 0)),
    recovered: toInteger(coalesce(line.Recovered, 0)),
    latitude: toFloat(line.Latitude),
    longitude: toFloat(line.Longitude)
})

MERGE (p)-[:IN]->(r)
CREATE (p)-[:MEASURED]->(s)
RETURN count(s);
