{% docs int_account_domains__aggregated %}
The intermediate model contains one row per Cloud account & email domain combination, and provides the basic boolean indicators & domain-level calculations that are used in the [int_account_domains__ranked](https://cloud.getdbt.com/accounts/1/jobs/940/docs/#!/model/model.fishtown_internal_analytics.int_account_domains__ranked) model. The outputs of this model help to determine what the leading business, partner, internal, and consumer domains are for a given Cloud account.
{% enddocs %}

{% docs int_account_domains__ranked %}
This intermediate model contains one row per Cloud account & email domain combination, and is an extension of the [int_account_domains__aggregated](https://cloud.getdbt.com/accounts/1/jobs/940/docs/#!/model/model.fishtown_internal_analytics.int_account_domains__aggregated) model. It provides the ranking fields necessary to decide which email domain is the most appropriate to map to a given Cloud account.
{% enddocs %}

{% docs int_cloud_account_mappings__primaries %}
This model infers which Cloud Account is the primary account for a given Organization. For information on how we map a Cloud account to a Salesforce account, please view [Cloud Account Mappings Decision Tree](https://lucid.app/publicSegments/view/40a71713-0115-48ba-9bd3-fff669666027/image.png).

**NOTE:** If you would like to link a dbt Cloud account to a Salesforce Account, please use override the Salesforce account on the associated dbt Cloud account object [in Salesforce](https://fishtown.lightning.force.com/lightning/o/dbt_Cloud_Account__c/list?filterName=Recent).
{% enddocs %}

{% docs int_cloud_account_mappings__stepped %}
This intermediate model contains one row per Cloud account mapped to its corresponding Salesforce account. The outputs of this model are not only used for Cloud account & Salesforce account linking, but also can be used to understand at which step in the decision tree the Cloud account is mapped at. The logic in this model directly reflects the Cloud Account Mappings Decision Tree, as shown below:
 

![Cloud account mappings decision tree](https://lucid.app/publicSegments/view/40a71713-0115-48ba-9bd3-fff669666027/image.png "Cloud Acount Mappings Decision Tree")
{% enddocs %}

{% docs int__customer_account_single_tenant_migration %}
This intermediate model brings in account information from [this asana board](https://app.asana.com/0/1203671999710652/1203714510462311) that indicates accounts that are in the single tenant migration workflow. The purpose of this model is to allow downstream models to know whether an account has completed their migration so that we can exclude single tenants from the appropriate reporting.
 
{% enddocs %}