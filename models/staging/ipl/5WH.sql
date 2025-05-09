SELECT 
    BATTER,
    COUNT(*) AS TOTAL_MATCHES_PLAYED,
    SUM(CASE WHEN RUN >= 50 THEN 1 ELSE 0 END) AS FIFTY_PLUS_SCORES,
    sum(run) as runs

FROM {{ref('silver_batsman')}}
GROUP BY BATTER
HAVING COUNT(*) >=5
        ORDER BY FIFTY_PLUS_SCORES desc , runs DESC