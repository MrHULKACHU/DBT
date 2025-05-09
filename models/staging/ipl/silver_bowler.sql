SELECT
    MATCH_NO,
    BOWLER,
    {{ standardize_team_name('TEAM') }} AS TEAM,
    CAST(NO_OVERS as FLOAT) AS TOTAL_OVERS_BOWLED,
    RUN AS RUNS_CONCEDED,
    WICKET AS WICKETS,
    ECONOMY,
    NO_BALL AS NO_BALLS
FROM {{ source('IPL', 'RAW_BOWLER') }}
