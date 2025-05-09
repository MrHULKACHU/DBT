select 
    ma.MATCH_NO,
    ma.HOME_TEAM,
    sc.HOME_TEAM_RUNS ,
	sc.HOME_TEAM_WICKETS ,
    sc.HOME_TEAM_OVERS ,
	ma.AWAY_TEAM,
    sc.AWAY_TEAM_RUNS ,
	sc.AWAY_TEAM_WICKETS ,
	sc.AWAY_TEAM_OVERS,
    ma.WINNER,
    ma.RESULT,
    ma.RESULT_MARGIN

    from {{ref('silver_matches')}} ma
    JOIN {{ref('silver_scorecard')}} sc
    ON ma.MATCH_NO = sc.MATCH_NO