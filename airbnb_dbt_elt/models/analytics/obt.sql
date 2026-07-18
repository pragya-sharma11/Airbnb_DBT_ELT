{%  set
    configs = [
        {
            "table": "AIRBNB.INTERMEDIATE_MODELS.INTM_BOOKINGS",
            "columns": "intm_bookings.*",
            "alias": "intm_bookings"
        },
        {
            "table": "AIRBNB.INTERMEDIATE_MODELS.INTM_LISTINGS",
            "columns": "intm_listings.HOST_ID, intm_listings.PROPERTY_TYPE, intm_listings.ROOM_TYPE, intm_listings.CITY, intm_listings.COUNTRY, intm_listings.ACCOMMODATES, intm_listings.BEDROOMS, intm_listings.BATHROOMS, intm_listings.PRICE_PER_NIGHT, intm_listings.PRICE_TAG, intm_listings.CREATED_AT AS LISTING_CREATED_AT",          
            "alias": "intm_listings",
            "join_condition": "intm_bookings.listing_id = intm_listings.listing_id"
        },
        {
            "table": "AIRBNB.INTERMEDIATE_MODELS.INTM_HOSTS",
            "columns": "intm_hosts.host_name, intm_hosts.host_since, intm_hosts.is_superhost, intm_hosts.response_rate, intm_hosts.created_at as HOST_CREATED_AT",
            "alias": "intm_hosts",
            "join_condition": "intm_listings.host_id = intm_hosts.host_id"
        }
    ]
%}

select
    {% for con in configs %}
        {{con.columns}} {% if not loop.last%},{%endif%}
    {% endfor %}
from 
    {% for con in configs %}
        {% if loop.first%}
            {{con['table']}} as {{con['alias']}} 
        {%else%}
            LEFT JOIN {{con['table']}} as {{con['alias']}} on {{con['join_condition']}}
        {%endif%}
    {% endfor %}