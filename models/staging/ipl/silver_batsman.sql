SELECT 
    MATCH_NO,
    BATTER,
      {{ standardize_team_name('TEAM') }} AS TEAM,
    RUN,
    BALL,
    FOURS,
    SIXES,
    ROUND((RUN * 1.0 / NULLIF(BALL, 0)*100), 2) AS OVERALL_STRIKE_RATE,
    OUT_BY_BOWLER,
    CASE 
        WHEN OUT_BY_BOWLER = 'Not Out' THEN 'NOT OUT'
        ELSE 'OUT'
    END AS OUT_STATUS

FROM {{ source('IPL', 'RAW_BATSMAN') }}
