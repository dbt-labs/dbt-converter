{% docs cc_failure_message%}
Text field that indicates if a customer's credit card has declined, expired, or has insufficient funds. This will update if the credit card is updated.
{% enddocs %}

{% docs cost_change_comment %}
If a subscription event falls under a plan change event that occurred mid-cycle, this comment describes the correction to the customer's cost.
{% enddocs %}

{% docs is_subscription_change_event %}
Boolean which flags if this susbcription event is a subscription line item charge OR if it's a subscription line item change event. This is used downstream to filter when a customer either pays for their subscription items or if their subscription items change. The latter is important when we consider upgrade or downgrade ARR changes downstream.
{% enddocs %}

{% docs price %}
The price of the line item charged during the subscription's billing cycle. This is the corrected price for the 1 Feb 2023 seat changes when we upgraded a customer's subscription plan from $50 to $100 but if it occurred mid-cycle (e.g. If their usage period ends Feb 16, then we want to ensure any seat upgrades/downgrades represent $50 until they renew on Feb 17th.)
{% enddocs %}

{% docs subscription_change_type %}
This describes if a stripe subscription event is new, an upgrade, or a downgrade. We use this downstream to correctly charge the total subscription line item amount or if it's an upgrade/downgrade in their subscription. If it is a subscription change event and this is `NULL` or `new`, then we charge the `cost`. But, if it's an upgrade/downgrade then we charge the `cost_change`.
{% enddocs %}

{% docs cost_change %}
This flags if there is a change in the subscription line item's cost compared to its previous charged amount. If this is higher, then it's an upgrade. If this is a lower, then it's a downgrade.
{% enddocs %}

{% docs total_charged_amount %}
This is how much subscription revenue we charged the customer. However, if the invoice is not paid or if it's a full-refund, then this will be 0. If this is an upgrade or downgrade subscription item event, then this is the `cost_change` If this is a `new` subscription line item or if it is the original charge for the subscription item, then this is the `cost`. We use this to attribute booked Self-Service ARR in the downstream `fct_cloud_transactions`+ models.
{% enddocs %}

{% docs subscription_revenue%}
The amount a customer is paying per invoice for their subscription alone. This is what we use to calculate ARR.
{% enddocs %}

{% docs subscription_prorations%}
This is a boolean (true/false) to indicate if an invoice is a prorated feed. Prorated invoices occur when a customer upgrades their account mid-subscription-cycle and they are charged a prorated amount for their cycle.
{% enddocs %}

{% docs invoice_sales_tax%}
The total sales tax (if applicable) on a given invoice.
{% enddocs %}

{% docs invoice_subtotal %}
The amount charged before taxes and with the refund. This is the field that we should use when we calculate revenue run rate (invoice_total - refund_subtotal - invoice_sales_tax).
{% enddocs %}

{% docs refund_subtotal%}
The total refund on an invoice sans sales tax.
{% enddocs %}

{% docs subscription_started_at%}
The date when a customer's subscription begins. We use this date to recognize revenue/churn.
{% enddocs %}

{% docs subscription_canceled_at%}
If this is null, then this is the timestamp when a customer canceled their subscription to dbt Cloud.
{% enddocs %}
