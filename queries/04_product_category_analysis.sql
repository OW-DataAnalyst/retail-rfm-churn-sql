-- Cel: sprawdzenie, które kategorie produktów dominują w segmentach wartości

WITH transaction_segments AS (
SELECT
        `Transaction ID`,
        `Product Category`,
        `Total Revenue`,
        NTILE(4) OVER (ORDER BY `Total Revenue` DESC) AS value_quartile
FROM onlinesalesdata
)

SELECT
    value_quartile,
    `Product Category`,
    COUNT(*) AS transactions_count,
    ROUND(SUM(`Total Revenue`),2)                                                                      AS total_revenue,
    ROUND(100 * SUM(`Total Revenue`) / SUM(SUM(`Total Revenue`)) OVER (PARTITION BY value_quartile),2) AS category_share_pct
FROM transaction_segments
GROUP BY value_quartile, `Product Category`
ORDER BY value_quartile, total_revenue DESC;
