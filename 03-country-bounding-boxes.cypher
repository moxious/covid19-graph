
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS 
FROM 'https://storage.googleapis.com/meetup-data/country-boundingboxes.csv' AS line

WITH 
    line.country as country,
    coalesce(coalesce(line.ISO3116, line.country), '') as iso3,
    toFloat(line.longmin) as longmin,
    toFloat(line.latmin) as latmin,
    toFloat(line.longmax) as longmax,
    toFloat(line.latmax) as latmax,
    coalesce(line.Wrapped, '') as wrapped

MATCH (c:Country)
WHERE c.name = country OR c.iso3 = iso3
SET 
    c.upperLeft=point({ latitude: latmin, longitude: longmin }),
    c.bottomRight=point({ latitude: latmax, longitude: longmax }),
    c.longmin=longmin,
    c.latmin=latmin,
    c.longmax=longmax,
    c.latmax=latmax,
    c.wrapped=wrapped
RETURN count(c);
