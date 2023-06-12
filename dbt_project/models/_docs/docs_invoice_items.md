{% docs invoice_item_end_date %}
The applicable end date of the service represented by the invoice item. 
{% enddocs %}

{% docs invoice_item_pretax_amount %}
The full pre-tax amount represented by an invoice line item, reflecting the relevant quantities and period. 
{% enddocs %}

{% docs invoice_item_start_date %}
The applicable start date of the service represented by the invoice item. 
{% enddocs %}

{% docs invoice_item_tax_amount %}
The full sales tax amount associated with an invoice line item. 
{% enddocs %}

{% docs invoice_item_transaction_type %}
The type of transaction represented by the invoice line item. 
{% enddocs %}

{% docs invoice_line_id %}
The individual line identifier for a particular invoice item, sourced from the system that processed the invoice.
(e.g. Salesforce, Stripe, Quickbooks) 
{% enddocs %}

{% docs is_professional_services_item %}
A Boolean indicator as to whether a given line item represents a professional services SKU.
{% enddocs %}

{% docs is_sales_tax_line_item %}
A Boolean indicator as to whether an entire invoice item represents sales tax. This only applies to legacy Quickbooks records, as 
sales tax was later included on the same line as the applicable item. 
{% enddocs %}