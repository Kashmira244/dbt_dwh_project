{{ config(materialized='ephemeral') }}

with source_data as (

select * from {{ source('sales', 'country') }}

)

select *
from source_data
