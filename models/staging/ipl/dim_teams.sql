
with team_matches AS (
    SELECT 
        TEAM,
        COUNT(*) AS MATCHES_PLAYED
    FROM (
        SELECT MATCH_NO, HOME_TEAM AS TEAM FROM {{ref('silver_matches')}}
        UNION ALL
        SELECT MATCH_NO, AWAY_TEAM AS TEAM FROM {{ref('silver_matches')}}
    )
    GROUP BY TEAM
)

SELECT * from team_matches