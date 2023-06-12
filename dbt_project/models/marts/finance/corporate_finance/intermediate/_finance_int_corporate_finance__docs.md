<!---------- MODEL DOCS ---------->

{% docs int__subscription_customer_transactions %}
Model contains base logic for Subscription Customer Transactions, primarily adding flags to transactions for use specifically for corporate finance modeling.
{% enddocs %}

{% docs int__subscription_customer_arr_balance %}
Model calculates Beginning and Ending ARR balance by customer and sales channel by month
{% enddocs %}

{% docs int__subscription_customer_arr_delta %}
Model contains changes to ARR balance by customer and sales channel by month
{% enddocs %}

{% docs int__employee_transfers %}
Model aggregates forecasted transfers as well as accepted internal offers and joins their existing payroll data from ADP
{% enddocs %}