{{ config(MATERIALIZED = 'incremental', unique_key = 'LISTING_ID') }}

SELECT 
    LISTING_ID,
    HOST_ID,
    PROPERTY_TYPE,
    ROOM_TYPE,
    CITY,
    COUNTRY,
    ACCOMMODATES,
    BEDROOMS,
    BATHROOMS,
    PRICE_PER_NIGHT,
{{ tag('price_per_night') }} as price_tag
from {{ref('raw_listings')}}