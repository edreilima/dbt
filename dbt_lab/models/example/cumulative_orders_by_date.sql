{{ config(materialized='table') }}

select distinct
    o.o_orderdate
    , sum(o_totalprice) over(order by o.o_orderdate) as cumulative_order_price
from snowflake_sample_data.tpch_sf1.orders o
order by 1
