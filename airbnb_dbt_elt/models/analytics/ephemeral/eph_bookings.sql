{{config(MATERIALIZED='ephemeral')}}

with bookings as (
    SELECT 
        BOOKING_ID,
        BOOKING_DATE,
        BOOKING_STATUS,
        CREATED_AT
        from {{ref('obt')}}
 )
 select * from bookings