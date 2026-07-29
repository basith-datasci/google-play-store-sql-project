SELECT App, COUNT(*) AS duplicate_count
FROM googleplaystore_clean
GROUP BY App
HAVING COUNT(*) > 1
ORDER BY duplicate_count DESC;

SELECT
    COUNT(*) AS total_rows,
    SUM(Rating IS NULL) AS missing_ratings,
    SUM(Category IS NULL) AS missing_categories,
    SUM(Type IS NULL) AS missing_types,
    SUM(Price IS NULL) AS missing_prices
FROM googleplaystore_clean;


SELECT DISTINCT Installs
FROM googleplaystore_clean
ORDER BY Installs;

SELECT DISTINCT Price
FROM googleplaystore_clean
ORDER BY Price;


UPDATE googleplaystore_clean
SET installs_clean =
REPLACE(REPLACE(Installs, '+', ''), ',', '');

SET SQL_SAFE_UPDATES = 0;

UPDATE googleplaystore_clean
SET installs_clean =
REPLACE(REPLACE(Installs, '+', ''), ',', '');


SELECT *
FROM googleplaystore_clean
WHERE Installs = 'Free';

SELECT DISTINCT Installs
FROM googleplaystore_clean
WHERE Installs NOT REGEXP '^[0-9,+]+$';

SELECT *
FROM googleplaystore_clean
WHERE Installs = 'Free';

DELETE FROM googleplaystore_clean
WHERE Installs = 'Free';

UPDATE googleplaystore_clean
SET price_clean = REPLACE(Price, '$', '');

SELECT
    Price,
    price_clean
FROM googleplaystore_clean
LIMIT 20;


ALTER TABLE googleplaystore_clean
ADD COLUMN price_clean DECIMAL(10,2);


SELECT
    App,
    Installs,
    installs_clean,
    Price,
    price_clean
FROM googleplaystore_clean
LIMIT 15;

SELECT DISTINCT Size
FROM googleplaystore_clean
ORDER BY Size;

SELECT COUNT(*) AS varies_count
FROM googleplaystore_clean
WHERE Size = 'Varies with device';


SELECT
    CASE
        WHEN Size LIKE '%M' THEN 'MB'
        WHEN Size LIKE '%k' THEN 'KB'
        WHEN Size = 'Varies with device' THEN 'Varies'
        ELSE 'Other'
    END AS size_type,
    COUNT(*) AS total
FROM googleplaystore_clean
GROUP BY size_type;

SELECT DISTINCT Size
FROM googleplaystore_clean
ORDER BY Size;


UPDATE googleplaystore_clean
SET size_mb =
CASE
    WHEN Size LIKE '%M'
        THEN CAST(REPLACE(Size,'M','') AS DECIMAL(10,2))

    WHEN Size LIKE '%k'
        THEN CAST(REPLACE(Size,'k','') AS DECIMAL(10,2))/1024

    WHEN Size = 'Varies with device'
        THEN NULL

    ELSE NULL
END;


SELECT DISTINCT Size
FROM googleplaystore_clean
WHERE size_mb IS NULL
ORDER BY Size;

SELECT
    Size,
    size_mb
FROM googleplaystore_clean
ORDER BY size_mb DESC
LIMIT 20;  

SELECT
    Size,
    size_mb
FROM googleplaystore_clean
LIMIT 20;


SELECT
    Size,
    size_mb
FROM googleplaystore_clean
LIMIT 20;

SELECT DISTINCT `Last Updated`
FROM googleplaystore_clean
LIMIT 20;

ALTER TABLE googleplaystore_clean
ADD COLUMN last_updated_date DATE;

UPDATE googleplaystore_clean
SET last_updated_date =
STR_TO_DATE(`Last Updated`, '%M %d, %Y');

SELECT DISTINCT `Last Updated`
FROM googleplaystore_clean
ORDER BY `Last Updated`;

SELECT COUNT(*)
FROM googleplaystore_clean
WHERE `Last Updated` LIKE '%-%';

SELECT
    `Last Updated`
FROM googleplaystore_clean
LIMIT 20;

UPDATE googleplaystore_clean
SET last_updated_date =
STR_TO_DATE(`Last Updated`, '%d-%b-%y');

UPDATE googleplaystore_clean
SET last_updated_date =
STR_TO_DATE(`Last Updated`, '%M %d, %Y');



SELECT
    `Last Updated`,
    last_updated_date
FROM googleplaystore_clean
LIMIT 20;