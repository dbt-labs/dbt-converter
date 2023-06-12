{% docs notion_databases_macro %}

SQL for dynamically unpacking notion databases from JSON into relational tables.
Designed with the consideration of a `final` CTE to designate model-specific
needs (i.e. primary keys).

The generated SQL will always fan out rows in the case of lateral flatten. Care
should be taken in the final CTE(s) to shape the data in exact accordance with the
desired grain of data.

To use it:

    {% raw %}{{ unpack_notion_databases(notion_database_id) }}{% endraw %}

    final as (

        select ... from unpack_json

    )

    select * from final

{% enddocs %}

{% docs channel_mapping_wildcards_macro %}
This macro enables us to use wildcard-style filters in our Channel Mapping dataset. This is utilized after the initial joins to the table have been created, enabling the channel mapping values to be prioritized, while filling in the blanks or any "other" values.

## Example
| Channel        | Sub Channel |  Medium | Source |
|----------------|-------------|---------|--------|
| Organic Social | Other       | social  | *      |
| Referral       | Other       | other   | *      |

Then any website traffic with the medium = `social` and a source that is not included in the channel mapping dataset will be mapped to the `Organic Social` channel and `Other` sub-channel.

The full channel mapping dataset can be found [in this Notion database](https://www.notion.so/dbtlabs/92d27ce58d5e4c08b35010bbdf6d071e?v=533ed0232c9249e7b7dca8ae587b7191&pvs=4) and referenced in the [fct_notion_channel_mapping](https://cloud.getdbt.com/accounts/1/jobs/940/docs/#!/model/model.fishtown_internal_analytics.fct_notion_channel_mapping) model.

{% enddocs %}