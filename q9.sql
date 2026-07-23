/*=========================================================
Question 9
Which subscription plans generate the highest revenue per licensed seat?
=========================================================*/
SELECT
    plan_tier,
    SUM(arr_amount) AS total_arr,
    SUM(seats) AS total_seats,
ROUND(

        SUM(arr_amount)
        / SUM(seats),2) AS revenue_per_seat

FROM ravenstack_subscriptions
GROUP BY plan_tier
ORDER BY revenue_per_seat DESC;