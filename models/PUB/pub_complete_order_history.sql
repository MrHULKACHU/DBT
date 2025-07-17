SELECT
  o.order_id,
  o.customer_id,
  o.order_date,
  c.customer_name,
  c.customer_address,
  c.market_segment,
  o.status AS order_status
FROM {{ ref('wrk_orders_v') }} o
JOIN {{ ref('wrk_customers_v') }} c 
  ON o.customer_id = c.customer_id
