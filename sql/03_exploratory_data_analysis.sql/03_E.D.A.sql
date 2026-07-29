SELECT
    Category,
    ROUND(AVG(Rating), 2) AS avg_rating,
    COUNT(*) AS total_apps
FROM googleplaystore_clean
WHERE Rating IS NOT NULL
GROUP BY Category
ORDER BY avg_rating DESC;

SELECT
    Category,
    SUM(installs_clean) AS total_installs
FROM googleplaystore_clean
GROUP BY Category
ORDER BY total_installs DESC
LIMIT 10;

SELECT
    Type,
    COUNT(*) AS total_apps,
    ROUND(AVG(Rating), 2) AS avg_rating,
    ROUND(AVG(price_clean), 2) AS avg_price
FROM googleplaystore_clean
GROUP BY Type;


SELECT
    Category,
    FORMAT(SUM(installs_clean), 0) AS total_installs
FROM googleplaystore_clean
GROUP BY Category
ORDER BY SUM(installs_clean) DESC
LIMIT 10;

SELECT
    App,
    Category,
    installs_clean
FROM googleplaystore_clean
ORDER BY installs_clean DESC
LIMIT 10; 


SELECT
    Category,
    COUNT(*) AS total_apps
FROM googleplaystore_clean
GROUP BY Category
ORDER BY total_apps DESC;

SELECT
    Category,
    App,
    Rating,
    RANK() OVER (
        PARTITION BY Category
        ORDER BY Rating DESC
    ) AS app_rank
FROM googleplaystore_clean
WHERE Rating IS NOT NULL;


WITH ranked_apps AS (
    SELECT
        Category,
        App,
        Rating,
        RANK() OVER (
            PARTITION BY Category
            ORDER BY Rating DESC
        ) AS app_rank
    FROM googleplaystore_clean
    WHERE Rating IS NOT NULL
)

SELECT *
FROM ranked_apps
WHERE app_rank <= 3
ORDER BY Category, app_rank;

SELECT
    Category,
    ROUND(AVG(Rating),2) AS avg_rating,
    DENSE_RANK() OVER (
        ORDER BY AVG(Rating) DESC
    ) AS category_rank
FROM googleplaystore_clean
WHERE Rating IS NOT NULL
GROUP BY Category; 


