Create database project1saas;
use project1saas;


##Question 1:
##Which referral source acquired the highest number of customer accounts?

SELECT
    referral_source,
    COUNT(account_id) AS total_accounts
FROM ravenstack_accounts
GROUP BY referral_source
ORDER BY total_accounts DESC;