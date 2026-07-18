{% set congigs = [
    {
        "table" : "AIRBNB.ANALYTICS_MODELS.OBT",
        "columns" : "analytics_obt.BOOKING_ID, analytics_obt.LISTING_ID, analytics_obt.HOST_ID,analytics_obt.TOTAL_BOOKING_AMOUNT, analytics_obt.ACCOMMODATES, analytics_obt.BEDROOMS, analytics_obt.BATHROOMS, analytics_obt.PRICE_PER_NIGHT, analytics_obt.RESPONSE_RATE",
        "alias" : "analytics_obt"
    },
    { 
        "table" : "AIRBNB.ANALYTICS_MODELS.DIM_LISTINGS",
        "columns" : "",
        "alias" : "DIM_listings",
        "join_condition" : "analytics_obt.listing_id = DIM_listings.listing_id"
    },
    {
        "table" : "AIRBNB.ANALYTICS_MODELS.DIM_HOSTS",
        "columns" : "",
        "alias" : "DIM_hosts",
        "join_condition" : "analytics_obt.host_id = DIM_hosts.host_id"
    }
] %}



SELECT 
        {{ congigs[0]['columns'] }}

FROM
    {% for config in congigs %}
    {% if loop.first %}
      {{ config['table'] }} AS {{ config['alias'] }}
    {% else %}
        LEFT JOIN {{ config['table'] }} AS {{ config['alias'] }}
        ON {{ config['join_condition'] }}
        {% endif %}
        {% endfor %}