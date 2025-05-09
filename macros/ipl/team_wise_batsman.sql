{% macro Batsman_Status_by_Team(batter_name) %}
    SELECT 
        BATTER,
        TEAM,
        SUM(RUN) AS TOTAL_RUNS,
        SUM(BALL) AS TOTAL_BALLS,
        ROUND(SUM(RUN) * 1.0 / NULLIF(SUM(BALL), 0), 2) AS OVERALL_STRIKE_RATE,
        SUM(FOURS) AS TOTAL_FOURS,
        SUM(SIXES) AS TOTAL_SIXES,
        ROUND(
            SUM(RUN) * 1.0 / NULLIF(COUNT(CASE WHEN OUT_STATUS = 'OUT' THEN 1 END), 0),2) AS AVERAGE
    FROM {{ ref("stg_batsman") }}
    WHERE BATTER = '{{ batter_name }}'
    GROUP BY BATTER, TEAM
{% endmacro %}
