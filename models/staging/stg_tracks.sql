{{ config(materialized='view') }}

select 

    {{ dbt_utils.surrogate_key(['track_id', 'playlist_id'])}} as track_playlist_id,
    track_id,			
    track_name,			
    artist_name,			
    artist_id,		
    track_popularity,				
    album_name,			
    album_id,			
    track_length,				
    cast(release_date as timestamp) as release_date,		
    playlist_id,			
    playlist_name,			
    genre

from {{ source('staging', 'tracks') }}

where track_id is not null
-- dbt build --m <model.sql> --var 'is_test_run': false
{% if var('is_test_run', default=false) %}

    limit 100

{% endif %}

