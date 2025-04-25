-- models/silver/silver_stores.sql

SELECT
    store_id,
    strore_type,
    store_size
FROM {{ ref('stg_stores') }}


