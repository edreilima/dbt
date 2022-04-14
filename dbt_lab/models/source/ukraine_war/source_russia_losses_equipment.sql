{{ config(materialized='view', tags=["dbt_postgres"]) }}

select
    *
    , current_timestamp  as dw_loaded_at
from {{ source('raw', 'russia_losses_equipment') }} 
