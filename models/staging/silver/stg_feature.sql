-- models/staging/stg_feature.sql

SELECT
    store AS store_id,
    TO_DATE(Date, 'DD/MM/YYYY') AS date,
    temperature,
    FUEL_PRICE,
    MARKDOWN1,
    MARKDOWN2,
    MARKDOWN3,
    MARKDOWN4,
    MARKDOWN5,
    CPI AS consumer_price_index,
    UNEMPLOYMENT AS unemployment_rate,
    ISHOLIDAY AS is_holiday_week
FROM {{ source('miniproj', 'FEATURE_DATA_SET') }}
WHERE
    MARKDOWN1 IS NOT NULL AND
    MARKDOWN2 IS NOT NULL AND
    MARKDOWN3 IS NOT NULL AND
    MARKDOWN4 IS NOT NULL AND
    MARKDOWN5 IS NOT NULL AND
    UNEMPLOYMENT IS NOT NULL AND
    CPI IS NOT NULL
