-- models/staging/silver/stg_stores.sql

SELECT
    store AS store_id,
    type AS strore_type,
    size AS store_size
FROM {{ source('miniproj', 'STORES_DATA_SET') }}
