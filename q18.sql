/*=========================================================
Question 18

Which subscription plans experience the highest customer churn rate?

Business Goal:
Identify plan tiers requiring retention initiatives.

Table Used:
- ravenstack_subscriptions
=========================================================*/
SELECT
   plan_tier, COUNT(subscription_id) AS total_subscriptions,
    SUM(
        CASE
            WHEN churn_flag = 'True' THEN 1
            ELSE 0
        END
    ) AS churned_subscriptions,

    ROUND(
      SUM(
            CASE
                WHEN churn_flag = 'True' THEN 1
                ELSE 0
            END
        ) * 100.0

        / COUNT(subscription_id)

    ,2) AS churn_rate_percentage,

    ROUND(AVG(arr_amount),2) AS average_arr

FROM ravenstack_subscriptions
GROUP BY plan_tier
ORDER BY churn_rate_percentage DESC;