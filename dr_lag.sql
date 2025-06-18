-- Query to check the dr lag from the OMS DB

WITH qb_get_dgmetrics AS (
     select 
          target_name
          , MAX( case when column_label = 'Apply Lag (seconds)' then to_number(value) end ) as apply_lag
          , MAX( case when column_label = 'Transport Lag (seconds)' then to_number(value) end ) as transport_lag
          , collection_timestamp
     from sysman.mgmt$metric_current
     where metric_name like '%dataguard%'
     and metric_label = 'Data Guard Performance' 
     and column_label in ('Apply Lag (seconds)', 'Transport Lag (seconds)' )
     group by target_name, collection_timestamp
)
select
     target_name
     , round(apply_lag/60/60,2) APPLY_LAG
     , round(transport_lag/60/60,2) TRANSPORT_LAG
     , collection_timestamp 
     , sysdate
from qb_get_dgmetrics
where apply_lag > 300 
and collection_timestamp > (sysdate-2/24)
and TARGET_NAME LIKE '%REPPRD%'; 
