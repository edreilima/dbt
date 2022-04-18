{{ config(materialized='incremental', unique_key='t_time', tags=["dbt_lab"]) }}

select 
    *, to_time(concat(T_HOUR::varchar, ':', T_MINUTE, ':', T_SECOND)) as time_aux
from snowflake_sample_data.tpcds_sf10tcl.time_dim 
--where time_aux <= dateadd(hour, -12, current_time)
where time_aux <= current_time

{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  and t_time > (select max(t_time) from {{ this }})

{% endif %}
