SELECT
        MATCH_NO,
        CITY,
        COALESCE(
            TRY_TO_DATE(DATE_OF_MATCH, 'DD-MM-YYYY'),    
            TRY_TO_DATE(DATE_OF_MATCH, 'DD/MM/YYYY'),    
            TRY_TO_DATE(DATE_OF_MATCH, 'MM/DD/YYYY')      
        ) AS 
        FORMATTED_DATE,
        VENUE ,
        
        {{ standardize_team_name('HOME_TEAM') }} AS HOME_TEAM,
        {{ standardize_team_name('AWAY_TEAM') }} AS AWAY_TEAM,
        {{ standardize_team_name('TOSS_WINNER') }} AS TOSS_WINNER,
        {{ standardize_team_name('WINNER') }} AS WINNER,
        
        
        TO_NUMBER(RESULT_MARGIN) AS RESULT_MARGIN,
       
        CASE WHEN RESULT ='Runs' THEN 'BATTING_FIRST'
        ELSE 'BATTING_SECOND' 
        END AS RESULT,
        UMPIRE1 ,
        UMPIRE2 

        from {{source('IPL','RAW_MATCHES')}}

