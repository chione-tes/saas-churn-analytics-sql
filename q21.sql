/*=========================================================
Question 21

How much ARR has been lost due to churn?
Business Goal:

Measure revenue impact of customer churn.

=========================================================*/

SELECT
SUM(arr_amount) AS total_arr,
SUM(
CASE
WHEN churn_flag='True'

THEN arr_amount

ELSE 0

END

) AS churned_arr,

ROUND(

SUM(

CASE

WHEN churn_flag='True'

THEN arr_amount

ELSE 0

END
)
*100/SUM(arr_amount),2
) 
AS percentage_arr_lost
FROM ravenstack_subscriptions;