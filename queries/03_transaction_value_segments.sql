-- Cel: segmentacja transakcji wg wartości (Total Revenue)

-- 1. Podział transakcji na kwartyle wg wartości
WITH transaction_segments AS (
SELECT
        `Transaction ID`,
        sale_date,
        `Product Category`,
        `Total Revenue`,
        NTILE(4) OVER (ORDER BY `Total Revenue` DESC) AS value_quartile
FROM onlinesalesdata
)

-- 2. Agregacja: ile transakcji i jaki % przychodu w każdym segmencie
SELECT
    value_quartile,
    COUNT(*) AS transactions_count,
    ROUND(SUM(`Total Revenue`),2)                                                            AS total_revenue,
    ROUND(100 * SUM(`Total Revenue`) / (SELECT SUM(`Total Revenue`) FROM onlinesalesdata),2) AS revenue_share_pct
FROM transaction_segments
GROUP BY value_quartile
ORDER BY value_quartile;
