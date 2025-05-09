SELECT 
        bowler AS PURPLE_CAP,
        SUM(WICKETS) AS WICKETS,
        SUM(RUNS_CONCEDED) AS RUNS_CONCEDED,
        ROUND(AVG(ECONOMY), 2) AS ECONOMY
    FROM {{ ref('silver_bowler') }}
    GROUP BY bowler
    ORDER BY WICKETS DESC
    
