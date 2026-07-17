{% set booked_nights = 1 %}
{% set flag = 2 %}
SELECT * from {{ref('raw_bookings')}}
{% if flag == 1 %}
    where nights_booked = {{booked_nights}}
{% else %}
    where nights_booked > {{booked_nights}}
{% endif %}