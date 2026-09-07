{{ config(unique_key='EMP_ID') }}

with source_data as (

select * from {{ source('sales', 'country') }}

)

select *
from source_data

{% if is_incremental() %}
where record_updated_on >
    (select max(record_updated_on) from {{ this }})
{% endif %}
