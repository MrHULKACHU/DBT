{% macro get_home_venues_for_team(team) %}
    {% set team_upper = team | upper %}
    {% if team_upper == 'PBKS' %}
        ['PUNJAB CRICKET ASSOCIATION IS BINDRA STADIUM', 'HIMACHAL PRADESH CRICKET ASSOCIATION STADIUM']
    {% elif team_upper == 'GT' %}
        ['NARENDRA MODI STADIUM']
    {% elif team_upper == 'LSG' %}
        ['BHARAT RATNA SHRI ATAL BIHARI VAJPAYEE EKANA CRICKET STADIUM']
    {% elif team_upper == 'SRH' %}
        ['RAJIV GANDHI INTERNATIONAL STADIUM']
    {% elif team_upper == 'RCB' %}
        ['M.CHINNASWAMY STADIUM']
    {% elif team_upper == 'CSK' %}
        ['MA CHIDAMBARAM STADIUM']
    {% elif team_upper == 'DC' %}
        ['ARUN JAITLEY STADIUM']
    {% elif team_upper == 'KKR' %}
        ['EDEN GARDENS']
    {% elif team_upper == 'RR' %}
        ['SAWAI MANSINGH STADIUM']
    {% else %}
        []
    {% endif %}
{% endmacro %}
