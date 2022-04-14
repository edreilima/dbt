{{ config(materialized='table', tags=["dbt_postgres"]) }}

select
    al1.date
    , al1.day as war_day
    , al1.aircraft
    , al1.helicopter
    , al1.tank
    , al1."APC" as apc
    , al1."field artillery" as field_artillery
    , al1."MRL"as mrl
    , al1."military auto"as military_auto
    , al1."fuel tank" as fuel_tank
    , al1.drone
    , al1."naval ship" as naval_ship
    , al1."anti-aircraft warfare" as anti_aircraft_warfare
    , al1."special equipment" as special_equipment
    , al1."mobile SRBM system"as mobile_srbm_system
    , al2.personnel
    , al2."personnel*" as personnel_aux
    , al2."POW" as pow
    , current_timestamp  as dw_loaded_at
from {{ ref('source_russia_losses_equipment') }} as al1
left join {{ ref('source_russia_losses_personnel') }} as al2
    on al1.date = al2.date
    and al1.day = al2.day
