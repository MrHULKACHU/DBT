
    SELECT 
        batter AS ORANGE_CAP,
        SUM(RUN) AS TOTAL_RUNS,
        ROUND((SUM(RUN) / SUM(BALL) * 100), 2) AS OVERALL_STRIKE_RATE
    FROM {{ ref('silver_batsman') }}
    GROUP BY batter
    ORDER BY TOTAL_RUNS DESC

