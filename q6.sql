/*=========================================================
Question 6:
Which countries generate the highest ARR per customer?

Tables Used:
- ravenstack_accounts
- ravenstack_subscriptions
=========================================================*/

SELECT
  a.country, COUNT(DISTINCT a.account_id) AS total_customers,
  SUM(s.arr_amount) AS total_arr, ROUND(AVG(s.arr_amount), 2) AS avg_arr_per_customer
FROM ravenstack_accounts AS a

INNER JOIN ravenstack_subscriptions AS s
       ON a.account_id = s.account_id
GROUP BY a.country
ORDER BY avg_arr_per_customer DESC;