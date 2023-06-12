{% docs all_business_hours %}

**Updated:** Oct 26th 2021
This model is specfically for Customer Support coverage hours ([see Notion doc](https://www.notion.so/dbtlabs/24-5-Support-Coverage-cef455a999534fbebf84be86bdf3279d)). This translates any date hour to the business hour (and the next business hour if a ticket is sent outside of our coverage). The goal is to eventually hit 24/5 coverage. As it stands the timeline of coverage hours is below:
- Before 9/14/2020: M-F, 8-5pm EST
- 9/14/2020 - 9/01/2021: M-F, 8-8pm EST
- After 9/2/2021: Sunday 7pm to Friday 8pm EST

{% enddocs %}


{% docs cloud_account_mappings %}

This model maps any Cloud Account to identifiers outside of our Postgres data source. For example, for a single Cloud Account, you'll be able to link their `salesforce_account_id`, `stripe_customer_id` (if applicable), `quickbooks_customer_id` (if applicable).

For information on how we map a Cloud Account to a Salesforce Account, please view the Cloud Account Decision Tree mapping logic below:
 
![Cloud account mappings decision tree](https://lucid.app/publicSegments/view/40a71713-0115-48ba-9bd3-fff669666027/image.png "Cloud Acount Mappings Decision Tree")

{% enddocs %}

{% docs marketing_campaign_mappings %}

This model features all unique marketing campaigns across Salesforce, Email (HubSpot), Paid Media (LinkedIn & Google Ads), Social Media (LinkedIn & Twitter), and Snowplow web traffic. In addition, it includes the total spend for each campaign. From Snowplow, campaigns are identified via the utm_campaign parameter. This table is designed to be used as the central mapping table for any marketing campaign, allow the end user to retrieve data from any marketing source by using a consistent campaign name. Since this is a mapping table, it should be used in conjunction with the `fct_campaign_members` model to analyze performance by campaign (left join fct_campaign_members using campaign_id).

**Important**: There are 3 different varieties of `campaign_name` in this table, and this is by design! Our marketing campaigns follow the below hierarchy (in order from most broad to most specific):
- `marketing_campaign_name` -> `parent_campaign_name` -> `campaign_name`

>> This is the value contained within the second position of our [marketing campaign nomenclature](https://www.notion.so/dbtlabs/Marketing-Nomenclature-Campaign-Naming-UTM-Parameters-702f34952834446cb23475ecccbd04c2). Using this field, you can group `parent_campaign_name` across different periods and campaign goals.

> **Parent Campaign Name**
>> This is the raw value of the parent campaign in Salesforce or in a HubSpot marketing campaign. From other datasources (including ad platform, social media, and website traffic) this is a duplicate of the campaign name. 
NOTE: This should _always_ follow the syntax of `campaign-period_campaign-name_campaign-goal`.

> **Campaign Name**
>> This is the name of the individual campaign contained within the parent campaign. This is the Campaign field from Salesforce, the email campaign name from HubSpot, the utm_campaign value from Snowplow, the marketing campaign name from HubSpot for social media posts, and the campaign_name from each ad platform.

### Example:
* **Marketing Campaign Name**: `dbt-101-live-session`
* **Parent Campaign Name**: `q1-2022_dbt-101-live-session_awareness`
* **Campaign Name(s)**:
    * `3/22/2022 dbt 101 Live Partner Session | North America`
    *  `dbt 101 live session - Wake the dead APAC`
    * `dbt 101Live Session EMEA - Invite Two`
    * etc...
{% enddocs %}

{% docs country_to_region_mappings %}

This model allows us to group Country Codes or Country Names into their respective Region Category. For example, country code `US`, or country names `United States` and `United States of America`, would be mapped to the region category `NA`.

There are two data sources that are feeding into this utils model:
* ISO-3661 country codes & names: which are the defacto international standard - [source data](https://www.iso.org/obp/ui/#search).
* Clearbit country codes & names: which is a custom list created by Clearbit that is utilized in Salesforce - [source data](https://docs.google.com/spreadsheets/d/1erIdqoy60JwLAnpb91EfoJV5YrXDnbwSaA-aqcBlw48/edit#gid=1188894786_).

Since there are instances where one country code can map to several country names (and thus several of the same region), it is suggested you use one of the following strategies in downstream models to avoid fan out:
* Option 1: filter the dataset to the appropriate data source if you know which one you want to use.  
    &emsp;Code example:
    ```sql
    {%raw%}region_lookup as (

        select * from {{ ref('country_to_region_mappings') }}
        where data_source = 'iso'
    ){%endraw%}
    ```

* Option 2: include a `unique_regions` CTE that grabs the unique combination of `country_code` & `region_category` - eliminating duplication on `country_name`. This is most useful if you don't need to pull in the country name into the downstream table, but rather just the `region_category`.  
    &emsp;Code example:
    ```sql
    {%raw%}region_lookup as (
    
        select * from {{ ref( 'country_to_region_mappings') }}

    ),

    unique_regions as (

        select distinct
            country_code,
            region_category
        
        from region_lookup

    ),{%endraw%}
    ```
{% enddocs %}