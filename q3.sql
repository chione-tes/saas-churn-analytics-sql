/*=========================================================
Question 3:
How many new customer accounts signed up each month?
Table Used:
- ravenstack_accounts
=========================================================*/
SELECT
    DATE_FORMAT(signup_date,'%Y-%m') AS signup_month,
    COUNT(account_id) AS new_accounts
FROM ravenstack_accounts
GROUP BY signup_month
ORDER BY signup_month;