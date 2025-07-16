
with sales as (
    select
        Store_ID as STORE,
        WEEK_DATE,
        SUM(TOTAL_WEEKLY_SALES) as TOTAL_WEEKLY_SALES
    from {{ ref('wrk_sales') }}
    group by Store_ID, WEEK_DATE
),

previous_week as (
    select
        STORE,
        WEEK_DATE,
        TOTAL_WEEKLY_SALES,
        lag(TOTAL_WEEKLY_SALES) over (partition by STORE order by WEEK_DATE) as PREVIOUS_WEEK_SALES
    from sales
)

select
    WEEK_DATE,
    STORE,
    TOTAL_WEEKLY_SALES,
    rank() over (order by TOTAL_WEEKLY_SALES desc) as SALES_RANK,
    PREVIOUS_WEEK_SALES,
    round((TOTAL_WEEKLY_SALES / PREVIOUS_WEEK_SALES) * 100, 2) as SALES_GROWTH_PERCENT
from previous_week
