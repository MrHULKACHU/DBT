SELECT 
    MATCH_NO,
    BATTER,
    TEAM,
    RUN,
    BALL,
    FOURS,
    SIXES,
    OUT_BY_BOWLER,
     CASE 
        WHEN OUT_BY_BOWLER = 'Not Out' THEN 'NOT OUT'
        ELSE 'OUT'
    END AS OUT_STATUS

FROM  {{source('IPL', 'RAW_BATSMAN')}}