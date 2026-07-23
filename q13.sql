/*=========================================================
Revenue Analytics Question 13

Revenue Performance Scorecard
=========================================================*/

WITH revenue_summary AS
(
SELECT
plan_tier, SUM(arr_amount) total_arr,
SUM(mrr_amount) total_mrr,
SUM(arr_amount)/SUM(seats) revenue_per_seat,
AVG(seats) avg_seats,
100*AVG(churn_flag) churn_rate,
100*AVG(upgrade_flag) upgrade_rate,
100*AVG(auto_renew_flag) auto_renew_rate
FROM ravenstack_subscriptions
GROUP BY plan_tier

)
SELECT

*,RANK() OVER(ORDER BY
total_arr DESC,
revenue_per_seat DESC,
churn_rate ASC
) plan_rank

FROM revenue_summary;