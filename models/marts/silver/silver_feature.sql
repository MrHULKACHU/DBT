
SELECT
    store_id,
    date,
    temperature,
    fuel_price,
    markdown1,
    markdown2,
    markdown3,
    markdown4,
    markdown5,
    consumer_price_index,
    unemployment_rate,
    is_holiday_week
FROM {{ ref('stg_feature') }}
