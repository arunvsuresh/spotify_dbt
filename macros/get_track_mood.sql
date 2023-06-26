{% macro get_track_mood(valence) %}
    CASE 
        when valence BETWEEN 0.0 AND 0.4 then 'sad'
        when valence BETWEEN 0.4 AND 0.8 then 'neutral'
        else 'happy'
    end
{% endmacro %}