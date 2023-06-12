{% docs int_account_based_marketing_stages %}
![Account Based Marketing Stages Logic](https://lucid.app/publicSegments/view/b0fbe487-2c12-4b55-a550-e9bcba1947f1/image.png "Account Based Marketing Stages Logic")
{% enddocs %}

{% docs int_predicted_cloud_datawarehouse %}
![Predicted Cloud Data Warehouse Logic](https://lucid.app/publicSegments/view/f53688cf-1137-49a4-811f-ee165fcd7a4e/image.png "Prediced Cloud Data Warehouse Logic")
{% enddocs %}

{% docs int_salesforce__territory_mappings %}
This model allows us to map zipcodes, states/provinces, and/or countries to their associated sales territory. For example, the state `Virginia` would be mapped to the `South Atlantic` sales territory.

**IMPORTANT**  
Some territories are defined at the zipcode level, while others at the state/province or country level. As a result, this model features every possible combination. Therefore, you will likely need to filter this data down to the level you are anticipating to join on in downstream models. Below is an example of how to do that:

* Example: include a `state_territories` or `country_territories` CTE that grabs the unique combination of `state_province` and `territory_name` (or `country_name` or `country_code` for countries). Ensure to group this data (and filter it) so that there is only 1 result at whatever grain you are grouping by.
    ```sql
    {% raw %} with
    
    state_territories as (
        select
            state_province,
            territory_name
        
        from {{ ref('int_salesforce__territory_mappings') }}
        where state_province is not null
            and zipcode is null -- required to filter out states that are forcing territories at the zipcode level, i.e. California
            and territory_id is not null -- required to filter out states that do not map to a territory
        group by 1,2

    ){% endraw %}
    ```

More information around territory mapping logic [can be found in this Notion doc](https://www.notion.so/dbtlabs/Territory-Mapping-Logic-41d57d9c6fb5411b89fd389d1ce44dd5?pvs=4).
{% enddocs %}