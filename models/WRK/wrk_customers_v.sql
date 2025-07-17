SELECT 
  c_custkey AS customer_id,
  c_name AS customer_name,
  c_address AS customer_address,
  c_nationkey AS country_id,
  c_phone AS contact_no,
  c_acctbal AS account_balance,
  c_mktsegment AS market_segment,
  c_comment AS comments
FROM {{ source('dbt_demo', 'customer') }}
