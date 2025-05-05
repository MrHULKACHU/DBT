

SELECT
    store_id,
    department_id,
    week_date,
    total_weekly_sales,
    is_holiday_week
FROM {{ ref('stg_sales') }}

