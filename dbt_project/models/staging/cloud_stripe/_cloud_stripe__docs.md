<!---------- SOURCE DOC ---------->
{% docs src_stripe %}

**Status:** Active

We use [Stripe](https://dashboard.stripe.com/) as our payment processor for accounts on the Team plan (i.e. Self-Service). It handles customers' subscription payments & invoicing.

{% enddocs %}


<!------------------ STRIPE INVOICE LINE ITEMS ------------------>

<!---------- MODEL DOC ---------->
{% docs stripe_invoice_line_items %}
Invoice Line Items consist of all items charged within a single invoice. For example, in one invoice, it will consist of:
- The subscription (e.g. Team plan)
- The items within the subscription (e.g. 3 license × Developer License (at $50.00 / month))
- Sales tax
- Invoiced items such as prorations or subscription upgrades
- and the associated revenue for each item.
    - subscription (Team plan x 3 seats): 150
    - subscription item (Team plan x 3 seats): 150
    - sales tax: 10.50
    - subscription upgrade: $43.33

Please note:
- If you sum the revenue per invoice, it will double count the cost of the subscription and the cost of the items within the subscription (see example above)

This model should only be used to look at the specific charges within an invoice.
If you want to aggregate the revenue from a self-service invoice, then we recommend using the `fct_stripe_invoices` model.
{% enddocs %}

<!---------- COLUMN DOCS ---------->
{% docs line_item_type %}
The line item's category or object that it belongs to (e.g. subscription, invoiceitem)
{% enddocs %}

{% docs line_item_subtype %}
The subcategory of the line item (e.g. if it's a subscription or a subscription item, such as extra slot or developer license seat).
{% enddocs %}


<!------------------ STRIPE INVOICES ------------------>

<!---------- IDENTIFIERS ---------->

{% docs stripe_plan_id %}
The plan_id designated by Stripe. This does not follow our dbt Cloud plan, rather it is either "free" or NULL. If it is NULL, then in downstream stream models, we designate these as "paid".
{% enddocs %}

<!---------- INFO ---------->

{% docs stripe_plan_name %}
The plan name designated by Stripe. This does not follow our dbt Cloud plan, rather it is either "Free" or NULL. If it is NULL, then in downstream stream models, we designate these as "Paid".
{% enddocs %}

<!---------- BOOLEANS ---------->
{% docs is_sales_tax_adjustment %}
Boolean (true/false) which indicates if this invoice was sales tax adjustment.
{% enddocs %}

{% docs is_subscription_upgrade %}
Boolean (true/false) which indicates if this invoice was a subscription upgrade or proration.
{% enddocs %}

{% docs stripe_is_paid_invoice %}
Boolean (true/false) which indicates if this invoice was paid.
{% enddocs %}

{% docs is_closed_invoice %}
Boolean (true/false) which indicates if this invoice was closed.
{% enddocs %}

{% docs is_charged_invoice %}
Boolean (true/false) which indicates whether a customer was actually
charged for this invoice. If a customer has not been charged for this
invoice, then in downstream revenue models, we should not include them.
{% enddocs %}

<!---------- MONEY ---------->
{% docs stripe_amount_due %}
The total amount that was due at the time of purchase, but before credit applied.
{% enddocs %}

{% docs stripe_amount_invoiced %}
The original invoiced amount with sales tax, but before credit applied and refunds.
{% enddocs %}

{% docs stripe_invoice_total %}
The amount that was charged to the customer with tax (if applicable) and applied credit, but before refunds.
{% enddocs %}

{% docs stripe_refund_total %}
The total refunded amount on an invoice.
{% enddocs %}

<!---------- DATES ---------->

{% docs invoice_date %}
The date when the invoice was charged.
{% enddocs %}

{% docs invoice_period_start %}
Start of the usage period during which the invoice items were added.
{% enddocs %}

{% docs invoice_period_end %}
End of the usage period during which the invoice items were added.
{% enddocs %}