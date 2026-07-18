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
{{ tag('cast(price_per_night as int)') }} as price_tag,
    CREATED_AT
from {{ref('raw_listings')}}