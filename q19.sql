/*=========================================================
Question 19

Does customer size influence churn?

Business Goal:
Compare churn across customer
size segments.

Table Used:
- ravenstack_subscriptions
=========================================================*/

WITH customer_segments AS
(

SELECT
subscription_id, arr_amount,

CASE
WHEN seats BETWEEN 1 AND 20 THEN 'Small'

WHEN seats BETWEEN 21 AND 50 THEN 'Medium'

ELSE 'Large'

END AS customer_size,
churn_flag
FROM ravenstack_subscriptions

)

SELECT customer_size, COUNT(*) AS total_customers,
SUM(
CASE

WHEN churn_flag='True'
THEN 1
ELSE 0
END

) AS churned_customers,

ROUND(

SUM(

CASE WHEN churn_flag='TRUE'

THEN 1 ELSE 0
END
)*100
/COUNT(*) ,2

) AS churn_rate_percentage,

ROUND(

AVG(arr_amount),2
) AS average_arr

FROM customer_segments
GROUP BY customer_size
ORDER BY churn_rate_percentage DESC;