/*=========================================================
Question 14
Customer Retention and Churn Analytics

What is the company's overall customer churn rate?

Business Goal:
Measure the percentage of customer accounts
that have churned.

Table Used:
- ravenstack_accounts
=========================================================*/

SELECT
   COUNT(account_id) AS total_customers,
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

FROM ravenstack_accounts;