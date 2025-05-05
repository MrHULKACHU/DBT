    {#
    this is  a macro that grant prvieldges to the particular schema and the role
    here the arguments are passed.
    there is another target function in the macros which specifies the current person details of what isbeing used. 
    target.schema tells us about the schema that the user has currently logged into

    run_query() is another function which basically runs the query. Here we run the set query.

    Then finally the log is the one where the details are logged and the info argument true makes sure it is seen in the logs and detiled logs
    #}


% macro grant_select(schema=target.schema, role=target.role) %}

  {% set sql %}
  grant usage on schema {{ schema }} to role {{ role }};
  grant select on all tables in schema {{ schema }} to role {{ role }};
  grant select on all views in schema {{ schema }} to role {{ role }};
  {% endset %}

  {{ log('Granting select on all tables and views in schema ' ~ target.schema ~ ' to role ' ~ role, info=True) }}
  {% do run_query(sql) %}
  {{ log('Privileges granted', info=True) }}

{% endmacro %}