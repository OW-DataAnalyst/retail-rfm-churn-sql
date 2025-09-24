-- Cel: obliczenie ARPU (Average Revenue Per Transaction) i proxy-LTV
-- Uwaga: brak Customer ID → LTV liczymy jako przybliżenie na poziomie transakcji

-- 1. Średnia wartość transakcji (ARPU globalne)

SELECT 
    ROUND(AVG(`Total Revenue`), 2) AS ARPU_global
FROM onlinesalesdata;


-- 2. ARPU per miesiąc (trend średniej wartości transakcji)

SELECT
    DATE_FORMAT(sale_date, '%Y-%m') AS month,
    ROUND(AVG(`Total Revenue`), 2) AS ARPU_month
FROM onlinesalesdata
GROUP BY DATE_FORMAT(sale_date, '%Y-%m')
ORDER BY month;

WITH monthly_stats AS (
    SELECT
        DATE_FORMAT(sale_date, '%Y-%m') AS month,
        COUNT(*) AS transactions_count,
        SUM(`Total Revenue`) AS revenue
    FROM onlinesalesdata
    GROUP BY DATE_FORMAT(sale_date, '%Y-%m')
)
SELECT
    ROUND(AVG(revenue / transactions_count), 2) AS avg_ARPU,
    ROUND(AVG(transactions_count), 2) AS avg_transactions_per_month,
    ROUND(AVG(revenue / transactions_count) * AVG(transactions_count), 2) AS proxy_LTV
FROM monthly_stats;
