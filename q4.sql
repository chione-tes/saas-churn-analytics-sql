/*=========================================================
Question 4:
Calculate the Month-over-Month (MoM) percentage growth
in customer signups.
Tables Used:
- ravenstack_accounts
=========================================================*/

-- Step 1: Calculate total signups for each month
WITH monthly_signups AS
(  SELECT
        DATE_FORMAT(signup_date, '%Y-%m') AS signup_month,
        COUNT(account_id) AS total_signups
    FROM ravenstack_accounts
    GROUP BY DATE_FORMAT(signup_date, '%Y-%m')
),

-- Step 2: Retrieve previous month's signups using LAG()
signup_growth AS
(SELECT
   signup_month, total_signups, LAG(total_signups) OVER (ORDER BY signup_month) AS previous_month_signups
FROM monthly_signups
)

-- Step 3: Calculate Month-over-Month Growth %
SELECT
    signup_month, total_signups, previous_month_signups,
  ROUND(
        (
	       (total_signups - previous_month_signups) / previous_month_signups) * 100,2
    ) AS mom_growth_percentage
FROM signup_growth ORDER BY signup_month;