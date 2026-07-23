/*=========================================================
 Question 12

Identify the Top 10 highest revenue-generating customer accounts

=========================================================*/
WITH customer_revenue AS
(
SELECT
  a.account_id, a.account_name, a.industry, SUM(s.arr_amount) AS total_arr
FROM ravenstack_accounts a
JOIN ravenstack_subscriptions s
ON a.account_id=s.account_id

GROUP BY
a.account_id, a.account_name, a.industry

)
SELECT
*,DENSE_RANK() OVER(
ORDER BY total_arr DESC

) AS revenue_rank
FROM customer_revenue
LIMIT 10;