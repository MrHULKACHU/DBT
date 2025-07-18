SELECT
  c.customer_id,
  c.customer_name,
  COUNT(o.order_id) AS total_orders,
  RANK() OVER (ORDER BY COUNT(o.order_id) DESC) AS customer_rank
FROM {{ ref('wrk_orders_v') }} o
JOIN {{ ref('wrk_customers_v') }} c 
  ON o.customer_id = c.customer_id
GROUP BY
  c.customer_id,
  c.customer_name
  ORDER BY customer_rank