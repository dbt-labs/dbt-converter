{% docs finance_period_start_date %}
The first date of a Salesforce-specified finance period. As these periods are often calendar months, 
this date is often the first of the month. 
{% enddocs %}

{% docs invoice_status %}
The processing status of a particular purchase invoice (e.g. Posted, Cancelled, Rebilled). This is 
available from Salesforce, but may not be populated for Quickbooks and other legacy invoices. 
{% enddocs %}

{% docs invoicing_subtotal %}
The pre-tax subtotal associated with a given invoice or invoice line item. This represents any per-item 
amount times the relevant quantity of each item. This may reflect discounts agreed upon at contracting. 
For purposes of revenue recognition, this subtotal is considering the paid invoice, while tax is processed
through separate accounting entries. 
{% enddocs %}

{% docs revenue_schedule_code %}
The human-readable identifier of the given revenue schedule in Salesforce, typically beginning with "RS-".
{% enddocs %}

{% docs salesforce_account_name %}
The name of a given Salesforce account. This is often the name of the organization corresponding to the account. 
{% enddocs %}

{% docs salesforce_contract_sign_date %}
The specific date on which a given contract for work was signed. This could be meaningfully different from an opportunity
close date, as well as the period of delivery. 
{% enddocs %}

{% docs sfdc_billing_finance_book_id %}
The unique Salesforce-generated identifier for a formal finance book that tracks transactions across a specific set of
legal entities. 
{% enddocs %}

{% docs sfdc_billing_finance_period_id %}
The unique Salesforce-generated identifier for a formal finance period. As of March 2023, this is typically
a calendar month.
{% enddocs %}

{% docs sfdc_billing_gl_rule_id %}
The unique Salesforce-generated identifier for a specific rule about the treatment of transactions for 
general ledger (GL) accounting. Per Salesforce, the rule itself allows one to group order products for evaluation 
under a certain GL rule when one performs a transaction. The GL treatments contain lookups to a credit GL 
account and a debit GL account.
{% enddocs %}

{% docs sfdc_billing_rule_id %}
The unique Salesforce-generated identifier for a specific rule about the billing of transactions. Per 
Salesforce, the rule itself allows one to group order products for evaluation under a certain billing rule 
and set of billing treatments. 
{% enddocs %}

{% docs sfdc_billing_treatment_id %}
The unique Salesforce-generated identifier for a specific treatment about the billing of transactions. 
For example, one can use billing treatments to specify an invoice plan and cancellation invoice plan 
for dynamic invoice plans. One can also set up cancellation rules.
{% enddocs %}

{% docs sfdc_legal_entity_reference_id %}
The unique Salesforce-generated identifier for the parent legal entity of the specific legal entity 
associated with a particular record. This field has the same domain as the sfdc_legal_entity_id, allowing
for recursive child-parent relationships. 
{% enddocs %}

{% docs sfdc_legal_entity_id %}
The unique Salesforce-generated identifier for a given legal entity associated with a particular record.
{% enddocs %}

{% docs sfdc_rev_rec_treatment_id %}
The unique Salesforce-generated identifier for revenue recognition treatment.
{% enddocs %}

{% docs sfdc_rev_schedule_id %}
The unique Salesforce-generated identifier for revenue schedules. Raw from Salesforce, these do not reflect our
accounting approaches to revenue recognition. 
{% enddocs %}

{% docs sfdc_tax_gl_rule_id %}
The unique Salesforce-generated identifier for a specific rule about the treatment of tax on a transaction 
for GL accounting. Per Salesforce, the rule itself allows one to group order products for evaluation under 
a certain GL rule when one performs a transaction. The GL treatments contain lookups to a credit GL account 
and a debit GL account.
{% enddocs %}

{% docs sfdc_tax_gl_treatment_id %}
The unique Salesforce-generated identifier for a specific general ledger (GL) treatment action related to tax on a transaction. 
{% enddocs %}

{% docs sfdc_tax_rule_id %}
The unique Salesforce-generated identifier for a specific rule about the treatment of tax on transactions, allowing
scalable accounting practices.
{% enddocs %}

{% docs sfdc_tax_treatment_id %}
The unique Salesforce-generated identifier for a specific treatment action related to tax on a transaction. 
{% enddocs %}

{% docs src_salesforce %}
**Status:** Active

Salesforce is a Customer Relationship Management (CRM) platform that our sales & marketing teams use to track customer activity and to connect with prospective customers. By using this platform, we can understand how many customers are in each stage of the buying journey at any given time. In addition, it enables our team to reach out to or market to specific customers or organizations based on a wide variety of attributes.

### How is it used?

* The Sales team uses the data provided by this platform to both determine where they should spend their energy and to report on their performance.
* The Marketing team uses this data to curate targeted campaigns and to analyze whether or not they are attracting appropriate prospects.
* The Customer Success team uses this to understand how healthy our accounts are and when they were last contacted.

Data from Salesforce is currently being loaded via Stitch and is refreshed every 30 minutes. We also have a specific job in our dbt project that refreshes this data every 15 minutes. Since this data is changing very frequently, this allows us to make sure the data is always as fresh as possible.

### Helpful resources

* For more information about Salesforce objects and what information is available from the platform, check out this [object reference guide](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_objects_list.htm).
* To understand how these tables connect to each other, check out [Fivetran's Salesforce ERD](https://docs.google.com/presentation/d/1fB6aCiX_C1lieJf55TbS2v1yv9sp-AHNNAh2x7jnJ48/edit)
* If you are interested in understanding our buyer's journey check out our [Marketing Funnel docs](https://www.notion.so/dbtlabs/Marketing-Funnel-0947c38657a54a2d9425f74db2fa4f5d)

{% enddocs %}


{% docs is_primary_cloud_account %}
We create custom logic to designate the primary dbt Cloud account for a given company. Please note we exclude all cancelled, deleted, or locked Cloud accounts from this calculation. This means that if a customer has only one Cloud Account and it is locked, cancelled, or deleted, then they do not have _any_ primary Cloud accounts. The remaining logic is as follows:

**For Enterprise Customers**
* If an existing customer only has one Cloud Account, then it is the primary account
* If an existing customer has more than one Cloud Account, then choose the Cloud Account with the most seats.

**For Team Plans**
* If an existing customer only has one Cloud Account, then it is the primary account
* If they have more than one Team plan, then choose the Cloud Account with the most seats.
  * If both have the same number of seats, choose the latest updated account.

**For Developer or Trial Plans**
* If it is their only Cloud Account then it is the primary account.
* If they have a mix of both, then choose the latest updated one.
* If all of their Cloud accounts are either locked or deleted, then choose the latest updated one.

**For Partner Accounts**
* If they have an existing Cloud Account that does not include their Partner account, then it will follow the above logic
* If they only have a Partner Cloud Account, then that account will be their primary account.

{% enddocs %}

{% docs customer_lifecycle_phase %}
The stage of the post-sales process that the account is in, from deal closed to utilization.
{% enddocs %}

{% docs stg_salesforce__clearbit %}

Clearbit is an enrichment tool used in our Salesforce instance to provide additional data around accounts and contacts.
The classifications and mappings used can be found [in this Google Sheet](https://docs.google.com/spreadsheets/d/1erIdqoy60JwLAnpb91EfoJV5YrXDnbwSaA-aqcBlw48/edit#gid=1561611259)

{% enddocs %}

{% docs stg_salesforce__contacts %}
The models features one row per contact in Salesforce. This data model is the basis for `dim_salesforce_contacts`. The Salesforce Contact object includes a range of information about a given Contact, including but not limited to name, email, sequences, qualification, and email activity. A full list of fields available from Salesforce Contacts can be found in the [object explorer](https://fishtown.lightning.force.com/lightning/setup/ObjectManager/Contact/FieldsAndRelationships/view).

{% enddocs %}

{% docs stg_salesforce__touchpoints %}

**NOTE**
This model is currently referencing the `lead__c` touchpoint in Salesforce. As a result, this is a direct copy of the `stg_salesforce__leads` model, but with aliased columns. We are expected to adjust the endpoint to `touchpoint__c` in Salesforce shortly, and therefore the model will no longer require aliased columns.

This model features one row per touchpoint in Salesforce. A touchpoint is defined as an interaction between a prospective customer and our business. This model serves as the basis for `fct_touchpoints`. A full list of fields available from Salesforce Touchpoints can be found in the [object explorer](https://fishtown.lightning.force.com/lightning/setup/ObjectManager/01I6g000001gtnw/FieldsAndRelationships/view).

{% enddocs %}

{% docs clearbit_company_type %}
The company's type (education, government, nonprofit, private, public, or personal)
{% enddocs %}

{% docs clearbit_industry %}
Third tier of company's industry classification
{% enddocs %}

{% docs clearbit_industry_group %}
Second tier of company's industry classification
{% enddocs %}

{% docs clearbit_sector %}
Broadest tier of company's industry classification
{% enddocs %}

{% docs clearbit_sub_industry %}
Most specific tier of company's industry classification
{% enddocs %}

{% docs clearbit_year_company_founded %}
Year company was founded
{% enddocs %}

{% docs account_status %}
The current status of the account. Each account can have one of the following statuses:
* **Customer**: paying customer with an Enterprise account
* **Churned Customer**: lost customer who stopped using the Enterprise plan
* **Prospect - Pipeline**: has an open land opportunity in the Discover or later stages
* **Prospect - Pre-pipeline**: has an open land opportunity in the Engage or Qualify stages
* **Prospect - Nurture**: has an open land opportunity in the Nurture stage
* **Inactive**: has no open Opportunities but can be prospected
* **DEI Do Not Contact**: the DEI team has flagged them as not to be worked with
{% enddocs %}

