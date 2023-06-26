{{ config(materialized='table') }}

with prod_track as (
    select *
    from {{ ref('stg_tracks') }}
), 


select 
    *
from prod_track;