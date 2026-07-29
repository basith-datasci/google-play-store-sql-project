SELECT COUNT(*) FROM googleplaystore;

SELECT COUNT(*) AS total_rows
FROM googleplaystore;

SELECT COUNT(*) AS total_columns
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'google_play_store'
AND TABLE_NAME = 'googleplaystore';

SELECT *
FROM googleplaystore
LIMIT 10;

SELECT COUNT(*)
FROM googleplaystore
WHERE Rating IS NULL;

SELECT COUNT(DISTINCT Category)
FROM googleplaystore;

SELECT DISTINCT Category
FROM googleplaystore
ORDER BY Category;

SELECT DISTINCT Type
FROM googleplaystore;

SELECT DISTINCT `Content Rating`
FROM googleplaystore;