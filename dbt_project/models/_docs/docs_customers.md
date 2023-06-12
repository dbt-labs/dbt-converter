{% docs customer_id %}
A unique identifier for a dbt customer, as sourced and synthesized from vendor identifiers.
See customer_id_type.
{% enddocs %}

{% docs customer_id_type %}
A descriptor of the source of the customer_id.
{% enddocs %}

{% docs customer_name %}
The business name of the customer in question, sourced from a number of different systems. It is recommended
to us customer_id_type as an indicator of the source system. 
{% enddocs %}

{% docs quickbooks_customer_id %}
The record identifier for the customer in the Quickbooks system.
{% enddocs %}

{% docs stripe_customer_id %}
The record identifier for the customer in the Stripe system.
{% enddocs %}
