-- 1

SELECT CONCAT(c.last_name, ', ',c.first_name) AS 'CUSTOMER NAME', c.customer_id AS 'CUSTOMER ID', MIN(s.start_date) AS 'START DATE'
FROM customer c 
JOIN subscription s ON c.customer_id= s.customer_id
GROUP BY c.customer_id
ORDER BY s.start_date;

-- 2

SELECT  p.plan AS 'PLAN_NAME',
	COUNT(s.plan_id) AS 'COUNT'
FROM subscription s
JOIN plan p USING (plan_id)
GROUP BY plan_id;

-- 3
	SELECT  'YES' AS'PROMO CUSTOMER' , 
		CASE 
		 WHEN s.offer_end_date < current_date() THEN 'OFFER ENDED'
		 ELSE s.offer_end_date 
		 END AS'OFFER_END_DATE',
		CONCAT(c.last_name, ', ',c.first_name) AS 'CUSTOMER NAME', 
		r.comp_code AS 'COMP CODE'
	FROM subscription s
	JOIN customer c USING (customer_id)
    JOIN region r USING (head_end)
	WHERE s.offer_end_date is NOT NULL
UNION ALL
	SELECT  'NO' AS'PROMO CUSTOMER' ,
		s.offer_end_date AS 'OFFER_END_DATE', 
		CONCAT(c.last_name, ', ',c.first_name) AS 'CUSTOMER NAME', 
		r.comp_code AS 'COMP CODE'
	FROM subscription s
	JOIN customer c USING (customer_id)
	JOIN region r USING (head_end)
	WHERE s.offer_end_date is NULL;

-- 4

SELECT CONCAT(c.last_name, ', ',c.first_name) AS 'CUSTOMER NAME',
	c.customer_id AS 'CUSTOMER ID',
	b.balance_due AS 'BALANCE DUE',
	b.billing_date AS 'BILLING_DATE'
FROM customer c
JOIN billing b USING (customer_id)
WHERE b.balance_due > 0.00
AND b.billing_date < current_date()
ORDER BY c.last_name;

-- 5
 SELECT CONCAT(c.last_name, ', ',c.first_name) AS 'CUSTOMER NAME',
		c.customer_id AS 'CUSTOMER ID'
 FROM customer c
 WHERE c.customer_id  IN
	(SELECT customer_id
		FROM subscription 
		GROUP BY customer_id
		HAVING COUNT(*) > 1)
ORDER BY c.last_name;

-- 6
 SELECT CONCAT(c.last_name, ', ',c.first_name) AS 'CUSTOMER NAME',
		c.customer_id AS 'CUSTOMER ID',
        p.plan AS 'PLAN'
 FROM customer c
 JOIN subscription s USING (customer_id)
 JOIN plan p using (plan_id)
 WHERE s.plan_id in (501,601,701)
 ORDER BY c.last_name;
    
-- 7

SELECT r.comp_code, r.head_end 
FROM region r
WHERE r.head_end IN
(SELECT DISTINCT(head_end) FROM customer);
    
 

