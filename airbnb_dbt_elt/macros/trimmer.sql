{% macros trimmer(col) %}
    {{col | trim | upper }}
{% endmacros %}