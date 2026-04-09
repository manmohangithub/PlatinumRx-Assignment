-- Hotel Queries

-- Q1
SELECT user_id, room_no
FROM (
    SELECT user_id, room_no,
           ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY booking_date DESC) rn
    FROM bookings
) t WHERE rn=1;

-- Q2
SELECT bc.booking_id,
SUM(i.item_rate*bc.item_quantity) total_amount
FROM booking_commercials bc
JOIN items i ON bc.item_id=i.item_id
WHERE DATE_FORMAT(bc.bill_date,'%Y-%m')='2021-11'
GROUP BY bc.booking_id;

-- Q3
SELECT bill_id,
SUM(i.item_rate*bc.item_quantity) bill_amount
FROM booking_commercials bc
JOIN items i ON bc.item_id=i.item_id
WHERE DATE_FORMAT(bc.bill_date,'%Y-%m')='2021-10'
GROUP BY bill_id
HAVING bill_amount>1000;

-- Q4
WITH item_orders AS (
 SELECT item_id, MONTH(bill_date) month,
 SUM(item_quantity) total_qty
 FROM booking_commercials
 WHERE YEAR(bill_date)=2021
 GROUP BY item_id, MONTH(bill_date)
)
SELECT * FROM (
 SELECT *,
 RANK() OVER(PARTITION BY month ORDER BY total_qty DESC) most_rank,
 RANK() OVER(PARTITION BY month ORDER BY total_qty ASC) least_rank
 FROM item_orders
) t WHERE most_rank=1 OR least_rank=1;

-- Q5
WITH bill_values AS (
 SELECT bill_id, MONTH(bill_date) month,
 SUM(i.item_rate*bc.item_quantity) total_bill
 FROM booking_commercials bc
 JOIN items i ON bc.item_id=i.item_id
 WHERE YEAR(bill_date)=2021
 GROUP BY bill_id, MONTH(bill_date)
)
SELECT * FROM (
 SELECT *,
 DENSE_RANK() OVER(PARTITION BY month ORDER BY total_bill DESC) rnk
 FROM bill_values
) t WHERE rnk=2;
