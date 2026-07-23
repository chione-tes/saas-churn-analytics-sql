/*=========================================================
Question 5
Which subscription plans contribute the highest share of total ARR?
=========================================================*/
use project1saas ;
SELECT
plan_tier, SUM(arr_amount) AS total_arr,
  ROUND(
        SUM(arr_amount) * 100 /
        SUM(SUM(arr_amount)) OVER(),
        2
    ) AS arr_percentage
FROM ravenstack_subscriptions
GROUP BY plan_tier
ORDER BY total_arr DESC;