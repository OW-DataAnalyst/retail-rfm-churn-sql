-- 1. Ile mamy rekordów
SELECT 
	COUNT(*) AS total_rows 
FROM onlinesalesdata;

-- 2. Duplikaty po Transaction ID
SELECT 
	'Transaction ID', 
	COUNT(*) AS cnt
FROM onlinesalesdata
GROUP BY 'Transaction ID'
HAVING COUNT(*) > 1;

-- 3. Braki w kluczowych kolumnach
SELECT
  SUM(`Transaction ID` IS NULL) 	AS null_txn,
  SUM(`Date` IS NULL) 				AS null_date,
  SUM(`Product Category` IS NULL) 	AS null_category,
  SUM(`Units Sold` IS NULL) 		AS null_units,
  SUM(`Unit Price` IS NULL) 		AS null_price,
  SUM(`Total Revenue` IS NULL) 		AS null_revenue,
  SUM(`Region` IS NULL) 			AS null_region,
  SUM(`Payment Method` IS NULL) 	AS null_payment
FROM onlinesalesdata;

-- 4. Spójność revenue
SELECT COUNT(*) AS mismatches
FROM onlinesalesdata
WHERE `Total Revenue` <> (`Units Sold` * `Unit Price`);

-- 5. Zakresy wartości
SELECT
  MIN(`Units Sold`) AS min_units,
  MAX(`Units Sold`) AS max_units,
  MIN(`Unit Price`) AS min_price,
  MAX(`Unit Price`) AS max_price,
  MIN(`Total Revenue`) AS min_revenue,
  MAX(`Total Revenue`) AS max_revenue
FROM onlinesalesdata;

-- 6. Kategorie i metody płatności
SELECT DISTINCT `Product Category` FROM onlinesalesdata;
SELECT DISTINCT `Payment Method` FROM onlinesalesdata;
