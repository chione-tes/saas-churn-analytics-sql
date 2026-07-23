/*=========================================================
Question 11:
Top 3 ARR generating customers within every industry
=========================================================*/

WITH customer_arr AS
(SELECT
   a.industry, a.account_id, a.account_name,
   SUM(s.arr_amount) AS total_arr
FROM ravenstack_accounts a
JOIN ravenstack_subscriptions s ON a.account_id=s.account_id
GROUP BY
a.industry,
a.account_id,
a.account_name
),

industry_rank AS
(
SELECT *, ROW_NUMBER() OVER(
PARTITION BY industry
ORDER BY total_arr DESC
) AS industry_rank

FROM customer_arr
)
SELECT industry, account_id, account_name, total_arr, industry_rank
FROM industry_rank WHERE industry_rank<=3
ORDER BY
industry, industry_rank;