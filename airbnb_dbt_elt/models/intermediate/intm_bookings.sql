{{  config( materialized = 'incremental' , unique_key = 'BOOKING_ID') }}

{# either insert new record is missing, update existing record is keys already exists  #}

select BOOKING_ID, LISTING_ID, BOOKING_DATE, 
    {{ multiply( 'NIGHTS_BOOKED', 'BOOKING_AMOUNT', 2) }} + CLEANING_FEE + SERVICE_FEE as total_booking_AMOUNT,
    BOOKING_STATUS, CREATED_AT
    from {{ ref('raw_bookings') }}

