
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(unique_key='EMP_ID') }}

with source_data as (

select * from {{ source('sales', 'src_emp') }}

)

select *
from source_data

{% if is_incremental() %}
where record_updated_on >
    (select max(record_updated_on) from {{ this }})
{% endif %}

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
