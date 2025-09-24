-- Cel: konwersja kolumny Date (TEXT) na DATE
-- Dzięki temu możemy liczyć Recency i churn

-- 1. Dodanie nowej kolumnę typu DATE
ALTER TABLE onlinesalesdata ADD COLUMN sale_date DATE;

-- 2. Konwertowanie wartości z kolumny Date (TEXT) do sale_date
UPDATE onlinesalesdata
SET sale_date = STR_TO_DATE(`Date`, '%Y-%m-%d');

-- 3. Sprawdzenie, czy konwersja się udała
SELECT `Date`, sale_date
FROM onlinesalesdata
LIMIT 20;
