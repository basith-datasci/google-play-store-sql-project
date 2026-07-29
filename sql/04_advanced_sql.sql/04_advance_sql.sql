
SELECT
    Category,
    App,
    Rating,
    RANK() OVER(
        PARTITION BY Category
        ORDER BY Rating DESC
    ) AS app_rank
FROM googleplaystore_clean
WHERE Rating IS NOT NULL;



SELECT
    Category,
    App,
    Rating,
    DENSE_RANK() OVER (
        PARTITION BY Category
        ORDER BY Rating DESC
    ) AS app_dense_rank
FROM googleplaystore_clean
WHERE Rating IS NOT NULL;


SELECT
    Category,
    App,
    Rating,
    NTILE(4) OVER(
        ORDER BY Rating DESC
    ) AS quartile
FROM googleplaystore_clean
WHERE Rating IS NOT NULL;


SELECT
    Category,
    App,
    Rating,
    FIRST_VALUE(App) OVER(
        PARTITION BY Category
        ORDER BY Rating DESC
    ) AS top_app
FROM googleplaystore_clean
WHERE Rating IS NOT NULL;


SELECT
    Category,
    App,
    Rating,
    LAST_VALUE(App) OVER (
        PARTITION BY Category
        ORDER BY Rating DESC
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS lowest_rated_app
FROM googleplaystore_clean
WHERE Rating IS NOT NULL;


SELECT
    Category,
    App,
    Rating,
    LAG(Rating) OVER (
        PARTITION BY Category
        ORDER BY Rating DESC
    ) AS previous_rating
FROM googleplaystore_clean
WHERE Rating IS NOT NULL;


SELECT
    Category,
    App,
    Rating,
    LEAD(Rating) OVER (
        PARTITION BY Category
        ORDER BY Rating DESC
    ) AS next_rating
FROM googleplaystore_clean
WHERE Rating IS NOT NULL;



SELECT
    Category,
    App,
    Rating,
    AVG(Rating) OVER (
        PARTITION BY Category
        ORDER BY Rating DESC
    ) AS running_avg
FROM googleplaystore_clean
WHERE Rating IS NOT NULL;


SELECT
    Category,
    App,
    Rating,
    ROUND(
        AVG(Rating) OVER (PARTITION BY Category),
        2
    ) AS category_avg_rating
FROM googleplaystore_clean
WHERE Rating IS NOT NULL;


WITH category_avg AS (
    SELECT
        Category,
        ROUND(AVG(Rating), 2) AS avg_rating
    FROM googleplaystore_clean
    WHERE Rating IS NOT NULL
    GROUP BY Category
)

SELECT *
FROM category_avg
ORDER BY avg_rating DESC;

SELECT
    App,
    Category,
    Rating
FROM googleplaystore_clean g
WHERE Rating >
(
    SELECT AVG(Rating)
    FROM googleplaystore_clean
    WHERE Category = g.Category
)
ORDER BY Rating DESC;



WITH category_avg AS (
    SELECT
        Category,
        AVG(Rating) AS avg_rating
    FROM googleplaystore_clean
    WHERE Rating IS NOT NULL
    GROUP BY Category
)

SELECT
    g.App,
    g.Category,
    g.Rating
FROM googleplaystore_clean g
JOIN category_avg c
ON g.Category = c.Category
WHERE g.Rating > c.avg_rating
ORDER BY g.Rating DESC;

WITH category_avg AS (
    SELECT
        Category,
        AVG(Rating) AS avg_rating
    FROM googleplaystore_clean
    WHERE Rating IS NOT NULL
    GROUP BY Category
)

SELECT
    g.App,
    g.Category,
    g.Rating
FROM googleplaystore_clean g
JOIN category_avg c
ON g.Category = c.Category
WHERE g.Rating > c.avg_rating
ORDER BY g.Rating DESC;