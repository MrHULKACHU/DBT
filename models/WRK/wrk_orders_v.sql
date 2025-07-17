SELECT 
  o_orderkey AS order_id,
  o_custkey AS customer_id,
  o_orderstatus AS status,
  o_orderdate AS order_date,
  o_comment AS comments
FROM {{ source('dbt_demo', 'orders') }}
