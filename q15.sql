/*=========================================================
Question 15

Which industries experience the highest
customer churn rate?

Business Goal:
Identify industries requiring targeted
retention strategies.

Table Used:
- ravenstack_accounts
=========================================================*/

SELECT
   industry, COUNT(account_id) AS total_customers,

    SUM(
        CASE
            WHEN churn_flag = 'True' THEN 1
            ELSE 0
        END
    ) AS churned_customers,

    ROUND(
        SUM(
            CASE
                WHEN churn_flag = 'True' THEN 1
                ELSE 0
            END
        ) * 100.0
        /
        COUNT(account_id),
        2
    ) AS churn_rate_percentage
FROM ravenstack_accounts
GROUP BY industry
ORDER BY churn_rate_percentage DESC;