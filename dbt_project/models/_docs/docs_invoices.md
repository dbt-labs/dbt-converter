{% docs invoice_created_at %}
The date at which a particular invoice record is created, potentially distinct from real-world dates, such as issuance. 
{% enddocs %}

{% docs invoice_id %}
The individual identifier for a particular invoice, sourced from the system that processed the invoice.
(e.g. Salesforce, Stripe, Quickbooks) 
{% enddocs %}

{% docs invoice_issue_date %}
The date at which a particular invoice is issued. 
{% enddocs %}

{% docs invoice_number %}
The human-readable identifier for a particular invoice, as it might appear on the invoice itself. 
{% enddocs %}

{% docs is_open_invoice %}
Boolean (true/false) as to whether a given invoice is still open (i.e. outstanding).
{% enddocs %}

{% docs is_paid_invoice %}
Boolean (true/false) that flags if the customer paid for this transaction.
{% enddocs %}