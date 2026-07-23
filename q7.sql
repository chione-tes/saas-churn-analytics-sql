/*=========================================================
Question 7:
Rank referral sources by total ARR generated.
Tables Used:
- ravenstack_accounts
- ravenstack_subscriptions
=========================================================*/

WITH referral_arr AS
(
    SELECT
        a.referral_source,
        SUM(s.arr_amount) AS total_arr
    FROM ravenstack_accounts AS a
    INNER JOIN ravenstack_subscriptions AS s
        ON a.account_id = s.account_id
    GROUP BY a.referral_source
)
SELECT referral_source, total_arr,
    RANK() OVER(ORDER BY total_arr DESC) AS referral_rank
FROM referral_arr ORDER BY referral_rank;