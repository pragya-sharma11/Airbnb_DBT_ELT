
{% macro tag(col, node) %}
    {# {% if col < 100 %}
        'Low'
    {% elseif col<400 %}
        'Medium'
    {% else %}
        'High'
    {% end %} #}

    CASE 
        WHEN {{ col }} < 100 THEN 'low'
        WHEN {{ col }} < 200 THEN 'medium'
        ELSE 'high'
    END
{% endmacro %}