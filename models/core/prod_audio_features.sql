{{ config(materialized='table') }}

with prod_audio_features as (
    select *
    from {{ ref('stg_audio_features') }}
),
genre as (
    select track_id as genre_track_id, genre
    from {{ ref('stg_tracks') }}
)

-- select * from genre

select 
    prod_audio_features.*,
    genre.genre
from prod_audio_features 
join genre on
prod_audio_features.track_id = genre.genre_track_id 
