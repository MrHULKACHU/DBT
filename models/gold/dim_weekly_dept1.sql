WITH weekly_sales AS (
    SELECT
        Store_ID,
        Department_Id,
        WEEK_DATE,
        SUM(TOTAL_WEEKLY_SALES) AS TOTAL_WEEKLY_SALES,
        MAX(IS_HOLIDAY_WEEK) AS IS_HOLIDAY_WEEK
    FROM {{ ref('silver_sales') }}
    GROUP BY Store_ID, Department_Id, WEEK_DATE
)

SELECT
    Store_ID,
    Department_Id,
    WEEK_DATE,
    TOTAL_WEEKLY_SALES,
    AVG(TOTAL_WEEKLY_SALES) OVER (PARTITION BY Store_ID, Department_Id) AS AVERAGE_DEPT_SALES,
    IS_HOLIDAY_WEEK
FROM weekly_sales