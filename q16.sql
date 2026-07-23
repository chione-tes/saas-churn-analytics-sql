/*=========================================================
Question 16 
Churn analytics

Which referral sources acquire customers
with the highest churn rate?

Business Goal:
Evaluate acquisition quality rather than
customer volume.

Table Used:
- ravenstack_accounts
=========================================================*/

SELECT
   referral_source, COUNT(account_id) AS total_customers,
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

FROM ravenstack_accounts GROUP BY referral_source
ORDER BY churn_rate_percentage DESC;