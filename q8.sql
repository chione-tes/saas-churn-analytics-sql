
## Question 8:
## Which referral sources acquire the highest-value customers?

## Tables Used:
## - ravenstack_accounts
## - ravenstack_subscriptions

SELECT
    a.referral_source, COUNT(DISTINCT a.account_id) AS total_customers,
    ROUND(AVG(s.arr_amount),2) AS avg_arr, ROUND(AVG(s.seats),2) AS avg_licensed_seats,
     SUM(s.arr_amount) AS total_arr
FROM ravenstack_accounts a
JOIN ravenstack_subscriptions s
ON a.account_id=s.account_id
GROUP BY a.referral_source ORDER BY avg_arr DESC;