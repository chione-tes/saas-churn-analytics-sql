/*=========================================================
Question 2:
Which referral source brings the highest average number of licensed seats per account?
Tables Used:
- ravenstack_accounts
- ravenstack_subscriptions
=========================================================*/

SELECT
    a.referral_source,
    ROUND(AVG(s.seats), 2) AS avg_licensed_seats,
    COUNT(DISTINCT a.account_id) AS total_accounts
FROM ravenstack_accounts AS a
INNER JOIN ravenstack_subscriptions AS s
    ON a.account_id = s.account_id
GROUP BY a.referral_source
ORDER BY avg_licensed_seats DESC;