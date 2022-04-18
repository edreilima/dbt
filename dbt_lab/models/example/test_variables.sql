{{ config(materialized='table', alias='test_table', tags=["dbt_lab"]) }}

select 
    *, to_time(concat(T_HOUR::varchar, ':', T_MINUTE, ':', T_SECOND)) as time_aux, {{ var('my_first_variable') }} as var_one
from snowflake_sample_data.tpcds_sf10tcl.time_dim 
--where time_aux <= dateadd(hour, -12, current_time)
where time_aux <= current_time
and t_time > {{ var('my_second_variable') }}
