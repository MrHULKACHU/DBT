select
    Store as store,
    Dept as department,
    TO_DATE(Date, 'YYYY-MM-DD') as date,  -- convert string to DATE
    Weekly_Sales as weekly_sales,
    IsHoliday as holiday
from {{ source('minproj', 'sales_data_set') }}
