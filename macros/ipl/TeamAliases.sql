-- macros/standardize_team_name.sql
{% macro standardize_team_name(team_name) %}
    CASE TRIM(UPPER({{ team_name }}))
        WHEN 'MUMBAI INDIANS' THEN 'MI'
        WHEN 'CHENNAI SUPER KINGS' THEN 'CSK'
        WHEN 'KOLKATA KNIGHT RIDERS' THEN 'KKR'
        WHEN 'DELHI CAPITALS' THEN 'DC'
        WHEN 'ROYAL CHALLENGERS BANGALORE' THEN 'RCB'
        WHEN 'RAJASTHAN ROYALS' THEN 'RR'
        WHEN 'PUNJAB KINGS' THEN 'PBKS'
        WHEN 'SUNRISERS HYDERABAD' THEN 'SRH'
        WHEN 'GUJARAT TITANS' THEN 'GT'
        WHEN 'LUCKNOW SUPER GIANTS' THEN 'LSG'
        ELSE {{ team_name }}
    END
{% endmacro %}
