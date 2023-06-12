<!---------- MODEL DOCS ---------->

{% docs fct_cloud_subscription_transactions %}
This model contains each Cloud customer's ARR and Revenue Run Rate per day and categorizes their changes in ARR with the ability to segment by Sales Motion (Self-Service or Managed).

Summing R3 will give the actual revenue per customer.

However, if you want to see ARR at the beginning/end of a month or quarter, we suggest using the utility flags within the model (e.g. `is_last_day_of_month`, `is_last_day_of_quarter`, etc).

**Resources:**
* [FP&A's Revenue Metrics Definitions](https://www.notion.so/dbtlabs/dbt-Labs-Key-Metrics-Definitions-eb9a65e358fd455b955b8382e0148df6#ea4695f8b4ac4c90b38e434ea6bc14ee): This document contains the definitions for ARR and Revenue Run Rate, as well as examples of how ARR and Revenue Run Rate across Managed Accounts and Self-Service accounts are calculated/recognized.
{% enddocs %}

{% docs fct_cloud_transactions %}
This model contains every charged Cloud transaction across Self-Service and Managed Accounts.
{% enddocs %}


<!---------- INFO ---------->

{% docs sales_motion %}
The Sales Motion in which this transaction fell under (e.g. Self-Service or Managed).
{% enddocs %}

{% docs sales_channel %}
The Sales Channel is a transformed version of Sales Motion, specific for Finance Reporting and Forecasting.
{% enddocs %}

{% docs transaction_description %}
The description of the transaction (e.g. Land/Renew/Expand/Subscription upgrade, etc)
{% enddocs %}

<!---------- BOOLEANS ---------->
{% docs is_customer_active %}
Boolean (true/false) that flags if a customer is active on this day (i.e. they have an active and paid contract).
{% enddocs %}

{% docs is_customer_first_day %}
Boolean (true/false) that flags if this is a customer's first day as an active, paying customer.
{% enddocs %}

{% docs is_upgrade %}
Boolean (true/false) that flags if this transaction is an upgrade (e.g. Expand for managed or adding seats/slots for self-service).
{% enddocs %}

<!---------- BOOLEANS (DATE UTILS) ---------->

{% docs is_first_day_of_month %}
Boolean (true/false) that flags if this is the first day of the month. This is used in Looker reporting to aggregate ARR based on the beginning of the month.
{% enddocs %}

{% docs is_last_day_of_month %}
Boolean (true/false) that flags if this is the last day of the month. This is used in Looker reporting to aggregate ARR at the end of the month.
{% enddocs %}

{% docs is_first_day_of_quarter %}
Boolean (true/false) that flags if this is the first day of the quarter. This is used in Looker reporting to aggregate ARR based on the beginning of the quarter.
{% enddocs %}

{% docs is_last_day_of_quarter %}
Boolean (true/false) that flags if this is the last day of the quarter. This is used in Looker reporting to aggregate at the end of the quarter.
{% enddocs %}

{% docs is_enterprise_upgrade %}
Boolean (true/false) that flags if this account change corresponded to an account moving from a Self-Serve to a Managed account.
{% enddocs %}

<!---------- DATES ---------->
{% docs finance_invoice_date %}
The date of the invoice/transaction. For managed accounnts, this is the close date.
{% enddocs %}

{% docs contract_start_date %}
The date the subscription/contract officially began.
{% enddocs %}

{% docs contract_end_date %}
The date the subscription/contract ends. For managed customers, this will be the contract end date in Salesforece + 1 day, as GTM and Finance have agreed churn should be recognized on the first day out of contract. For self-service customers, this will be null if they have not cancelled their subscription.
{% enddocs %}

{% docs usage_start_date %}
When the usage officially begins and when we recognize ARR/revenue. For managed accounts, this is the close date. For self-service accounts, the date is the same day as the subscription start date, but in whatever month they are currently paying for.
{% enddocs %}

{% docs usage_end_date %}
When the service usage ends. For managed accounts, this is the contract end date. For self-service accounts, this is based off of the subscription date or the subscription cancellation date. However, if there's a payment failure that is unresolved, then the usage period ends 8 days after their usage period begins.
{% enddocs %}

{% docs usage_period_in_months %}
The total service/usage months alloted in the transaction.
{% enddocs %}

{% docs customer_day %}
The day # of a customer since their first created date.
{% enddocs %}


<!---------- REVENUE ---------->

{% docs customer_starting_arr %}
The initial ARR that a customer first started with. This can be used to see how a customer's value has increased/decreased over time.
{% enddocs %}

{% docs revenue_run_rate %}
The actual revenue that the customer paid for, including prorations for upgrades on Self-Service accounts. For self-service, this is recognized when the subscription starts and when it is renewed. If it is a mid-cycle subscription upgrade, we recognize R3 on the invocie date.

For managed accounts, we reconigze R3 for subscription cost and for upgrades on the contract start date for the closed won opportunity..
{% enddocs %}

{% docs arr %}
The total ARR recognized after the time of payment during the given period. This is solely subscription revenue and does not include prorations.

For managed accounts, this is their ACV (re: ending ARR). We recognize ARR at either the close date for managed accounts.

For self-service accounts, this is the subscription revenue * 12.  We recognize self-service ARR on the subscription start date/recurring subscription renewal date for self-service accounts.
{% enddocs %}

{% docs arr_prior %}
The ARR from the prior day. This is used to calculate how the ARR changed and how much ARR was renewed on a daily level.
{% enddocs %}

{% docs arr_renewal %}
The ARR that was renewed per day.
{% enddocs %}

{% docs arr_change %}
The ARR that changed compared to the ARR from the previous day.
{% enddocs %}

{% docs change_category %}
If the ARR for a given customer has changed, this text field describes what the change was (e.g. new, upgrade, downgrade, S2M (self-service to managed, reactivated, and churn).
{% enddocs %}

<!---------- CHURN ---------->
{% docs churn_type %}
Churn falls into two categories: passive and active. Passive churn is due to a payment failure. Active churn is due to a customer downgrading or cancelling their Cloud Account.
{% enddocs %}

{% docs churn_details %}
This field categorizes the details of a passive or active churn. To read more details about this how we define this, please view this [Notion Doc](https://www.notion.so/dbtlabs/Data-x-CS-FY2023-Q3-56ae95f414c349f5898465c707a055c2#521291bf634c44c3a0a2614defd5cdb6).
{% enddocs %}