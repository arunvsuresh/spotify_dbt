{{ config(materialized='view') }}

select

    {{ dbt_utils.surrogate_key(['id', 'uri'])}} as track_pid,
    danceability,			
    energy,			
    key,				
    loudness,			
    mode,				
    speechiness,			
    acousticness,			
    instrumentalness,			
    liveness,			
    valence,			
    tempo,			
    type,				
    id as track_id,				
    uri,				
    track_href,				
    analysis_url,				
    duration_ms,				
    time_signature,
    {{get_track_mood('valence')}} as track_mood	

from {{ source('staging', 'audio_features') }}

where id is not null

{% if var('is_test_run', default=false) %}

    limit 100

{% endif %}