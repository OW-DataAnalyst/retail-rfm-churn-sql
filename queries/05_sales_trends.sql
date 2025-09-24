
-- Cel: analiza trendów sprzedaży w czasie 

SELECT
    DATE_FORMAT(sale_date, '%Y-%m') AS month,
    COUNT(*) 						AS transactions_count,
    ROUND(SUM(`Total Revenue`),2) 	AS total_revenue
FROM onlinesalesdata
GROUP BY DATE_FORMAT(sale_date, '%Y-%m')
ORDER BY month;

