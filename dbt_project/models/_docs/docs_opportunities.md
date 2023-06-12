{% docs opportunity_name %}
The human-readable identifier of a particular opportunity, often including the customer/account name followed
by the type of opportunity (e.g. Cisco - Land)
{% enddocs %}

{% docs opportunity_total_price %}
The total price of the line item with discounts included. This is calculated as unit_price x quantity x (1 - discount_pct).
{% enddocs %}

{% docs opportunity_unit_price %}
The total price per unit within a line item. This is calculated as total_price / quantity.
{% enddocs %}

{% docs sfdc_opportunity_id %}
The Salesforce ID of the opportunity.
{% enddocs %}

{% docs sfdc_opportunity_id_foreign %}
The Salesforce ID of the associated opportunity.
{% enddocs %}