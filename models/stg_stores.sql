select
    STORE AS Store_ID,
	TYPE AS Store_type,
	SIZE AS Store_size

from {{ source('minproj', 'stores_data_set') }}