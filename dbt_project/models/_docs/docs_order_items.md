{% docs order_item_number %}
The human-readable identifier of the given order item in Salesforce (e.g. order item 1234 would be represented as '1234').
{% enddocs %}

{% docs order_item_quantity %}
The quantity of the product being itemized.
{% enddocs %}

{% docs order_item_periods %}
The number of periods in a particular service span, relevant to the period defined in pricing. For instance,
if a price is per seat per month, this field indicates the number of months for the particular order item.
{% enddocs %}

{% docs order_item_total_price %}
The total price of the line item with discounts included. This is calculated as unit_price x quantity x (1 - discount_pct).
{% enddocs %}

{% docs order_item_unit_price %}
The total price per unit within a line item. This is calculated as total_price / quantity.
{% enddocs %}

{% docs order_item_unit_price_per_period %}
The total price per unit per period within a line item. This is calculated as total_price / quantity / period.
{% enddocs %}

{% docs service_end_date %}
The date at which the service represented by the line item ends.
{% enddocs %}

{% docs service_start_date %}
The date at which the service represented by the line item begins.
{% enddocs %}

{% docs sfdc_order_item_id %}
The Salesforce ID of the order item.
{% enddocs %}

{% docs sfdc_order_item_id_foreign %}
The Salesforce ID of the associated order item.
{% enddocs %}

