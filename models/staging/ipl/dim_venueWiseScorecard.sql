WITH VenueScores AS (
    SELECT 
        ma.VENUE,

        CASE
            WHEN ma.RESULT = 'BATTING_FIRST' AND ma.WINNER = ma.HOME_TEAM THEN sc.HOME_TEAM_RUNS
            WHEN ma.RESULT = 'BATTING_FIRST' AND ma.WINNER = ma.AWAY_TEAM THEN sc.AWAY_TEAM_RUNS
            ELSE NULL
        END AS BAT_FIRST_SCORE,

    
        CASE
            WHEN ma.RESULT = 'BATTING_SECOND' AND ma.WINNER = ma.HOME_TEAM THEN sc.AWAY_TEAM_RUNS
            WHEN ma.RESULT = 'BATTING_SECOND' AND ma.WINNER = ma.AWAY_TEAM THEN sc.HOME_TEAM_RUNS
            ELSE NULL
        END AS BAT_SECOND_SCORE

    FROM {{ ref('silver_matches') }} ma
    JOIN {{ ref('silver_scorecard') }} sc
        ON ma.MATCH_NO = sc.MATCH_NO
)

SELECT
    v.VENUE,
    COUNT(*) AS TOTAL_MATCHES_PLAYED,  -- Count matches by VENUE
    ROUND(AVG(v.BAT_FIRST_SCORE),2) AS AVERAGE_BAT_FIRST_SCORE,
    ROUND(AVG(v.BAT_SECOND_SCORE),2) AS AVERAGE_BAT_SECOND_SCORE,

FROM VenueScores v
GROUP BY v.VENUE
ORDER BY TOTAL_MATCHES_PLAYED DESC
