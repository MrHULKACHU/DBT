{{
    config(
        materialized='view'
    )
}}
select o_orderkey as "order_id",
       o_custkey as "customer_id",
       o_orderstatus as "status",
       o_orderdate as "order_date",
       o_comment as "comments"
from dbt_demo.raw.orders