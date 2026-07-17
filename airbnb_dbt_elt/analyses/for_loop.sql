{% set cols = ['NIGHTS_BOOKED', 'BOOKING_ID', 'BOOKING_AMOUNT'] %}

select 
{% for col in cols %}
    {% if col == 'NIGHTS_BOOKED' %}
        case when {{col}}>2 then {{multiply(col,2.43423,2)}} else {{col}} end as "nights_penalty" {% if not loop.last %} , {% endif %}
    {%else%}
        {{col}} {% if not loop.last %} , {% endif %}
    {%endif%}

{% endfor %}
from {{ref('raw_bookings')}}