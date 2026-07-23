/*=========================================================
Question 20

Do upgrades or downgrades increase churn?

Business Goal:
Evaluate churn by subscription change.

=========================================================*/

WITH subscription_changes AS
(

SELECT
subscription_id,
arr_amount,

CASE
WHEN upgrade_flag='True' THEN 'Upgrade'

WHEN downgrade_flag='True'
THEN 'Downgrade'
ELSE 'No Change'
END AS subscription_status,
churn_flag
FROM ravenstack_subscriptions
)

SELECT

subscription_status, COUNT(*) AS subscriptions,

SUM(
CASE
WHEN churn_flag='TRUE'
THEN 1
ELSE 0

END

) AS churned_customers,

ROUND(
SUM(
CASE
WHEN churn_flag='True'
THEN 1
ELSE 0
END
)*100
/COUNT(*),2
) AS churn_rate_percentage,

ROUND(

AVG(arr_amount),2
) AS average_arr

FROM subscription_changes

GROUP BY subscription_status

ORDER BY churn_rate_percentage DESC;