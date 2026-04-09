-- Clinic Queries

-- Q1
SELECT sales_channel, SUM(amount) revenue
FROM clinic_sales
WHERE YEAR(datetime)=2021
GROUP BY sales_channel;

-- Q2
SELECT uid, SUM(amount) total_spent
FROM clinic_sales
WHERE YEAR(datetime)=2021
GROUP BY uid
ORDER BY total_spent DESC
LIMIT 10;

-- Q3
WITH revenue AS (
 SELECT cid, MONTH(datetime) month, SUM(amount) revenue
 FROM clinic_sales
 WHERE YEAR(datetime)=2021
 GROUP BY cid, MONTH(datetime)
),
expense AS (
 SELECT cid, MONTH(datetime) month, SUM(amount) expense
 FROM expenses
 WHERE YEAR(datetime)=2021
 GROUP BY cid, MONTH(datetime)
)
SELECT r.cid, r.month, r.revenue,
COALESCE(e.expense,0) expense,
(r.revenue-COALESCE(e.expense,0)) profit,
CASE WHEN (r.revenue-COALESCE(e.expense,0))>0 THEN 'Profitable'
ELSE 'Not Profitable' END status
FROM revenue r
LEFT JOIN expense e
ON r.cid=e.cid AND r.month=e.month;

-- Q4
WITH profit_calc AS (
 SELECT c.city, cs.cid,
 SUM(cs.amount)-COALESCE(SUM(e.amount),0) profit
 FROM clinics c
 JOIN clinic_sales cs ON c.cid=cs.cid
 LEFT JOIN expenses e ON c.cid=e.cid
 GROUP BY c.city, cs.cid
)
SELECT * FROM (
 SELECT *,
 RANK() OVER(PARTITION BY city ORDER BY profit DESC) rnk
 FROM profit_calc
) t WHERE rnk=1;

-- Q5
WITH profit_calc AS (
 SELECT c.state, cs.cid,
 SUM(cs.amount)-COALESCE(SUM(e.amount),0) profit
 FROM clinics c
 JOIN clinic_sales cs ON c.cid=cs.cid
 LEFT JOIN expenses e ON c.cid=e.cid
 GROUP BY c.state, cs.cid
)
SELECT * FROM (
 SELECT *,
 DENSE_RANK() OVER(PARTITION BY state ORDER BY profit ASC) rnk
 FROM profit_calc
) t WHERE rnk=2;
