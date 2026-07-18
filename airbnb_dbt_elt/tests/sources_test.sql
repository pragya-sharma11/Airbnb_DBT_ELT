{{config(severity='warn')}}
SELECT * from  {{ source('staging', 'bookings') }}
where booking_amount<0