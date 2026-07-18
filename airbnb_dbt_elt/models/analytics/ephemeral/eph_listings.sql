{{
  config(
    materialized = 'ephemeral',
    )
}}

with listings as (
    select
        LISTING_ID,
        CITY,
        COUNTRY,
        PRICE_TAG,
        LISTING_CREATED_AT
    from {{ref('obt')}}
)
select * from listings
