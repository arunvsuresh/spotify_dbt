{{ config(materialized='table') }}

with prod_audio_features as (
    select *
    from {{ ref('stg_audio_features') }}
)


select 
    *
from prod_audio_features