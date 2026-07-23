/*=========================================================
Question 10:
Which industries contribute the highest ARR?

Tables:
- ravenstack_accounts
- ravenstack_subscriptions
=========================================================*/

SELECT
	a.industry, COUNT(DISTINCT a.account_id) AS total_accounts,
    SUM(s.arr_amount) AS total_arr,
	ROUND(SUM(s.arr_amount) /
          COUNT(DISTINCT a.account_id),2) AS avg_arr_per_account
FROM ravenstack_accounts a
JOIN ravenstack_subscriptions s ON a.account_id = s.account_id
GROUP BY a.industry ORDER BY total_arr DESC;