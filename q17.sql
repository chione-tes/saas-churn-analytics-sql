/*=========================================================
Question 17
Churn analytics and customer retention

Does billing frequency influence customer churn?

Business Goal:
Compare churn rates between monthly and annual subscriptions.

Table Used:
- ravenstack_subscriptions
=========================================================*/

SELECT
billing_frequency, COUNT(subscription_id) AS total_subscriptions,
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
        /COUNT(subscription_id),2) AS churn_rate_percentage

FROM ravenstack_subscriptions GROUP BY billing_frequency
ORDER BY churn_rate_percentage DESC;