-- models/staging/stg_sales.sql

SELECT
    Store AS store_id,
    Dept AS department_id,
    TO_DATE(Date, 'DD/MM/YYYY') AS week_date,
    TO_NUMBER(Weekly_Sales) AS total_weekly_sales,
    IsHoliday AS is_holiday_week
FROM {{ source('miniproj', 'SALES_DATA_SET') }}
