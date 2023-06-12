{% docs stg_quickbooks__customer_id_map %}

This table allows a developer to map a quickbooks `customer_id` to any other `customer_id`. As of this writing, this has been used for two purposes:

1. To map one quickbooks `customer_id` to another quickbooks `customer_id`. This was necessary when we migrated from one quickbooks account to another, as all customer records were brought over and the ids needed to be mapped together and deduplicated.
2. To map a quickbooks `customer_id` to a stripe `customer_id`. This is necessary whenever a self-service account upgrades to an enterprise subscription so that the stream of payments has a single `customer_id` for its entirety, thereby looking like an upgrade (as it should).

Quickbooks staging models incorporate this mapping data for the `customer_id` stitching that they do.

{% enddocs %}

{% docs stg_quickbooks__account_id_map %}
This is a Quickbooks `customer_id` to dbt Cloud `account_id` mapping table. When a multi-tenant Enterprise client does not have a self-service dbt Cloud account prior, we use this mapping table to associate their `quickbooks_customer_id` to their dbt Cloud account. We also use the Customer Name (the customer name in Quickbooks) as the "Customer Name" so we can keep track of who is currently in here. If they are a single-tenant client, then they will not be listed in this mapping table as we do not have their Postgres data available in our warehouse (yet).

We use this in the `dim_customers` table.

**NOTE:** If they are a self-service upgrade, then we use the `stg_quickbooks__customer_id_map` seed file to map their Quickbooks `customer_id` to their Stripe `customer_id`. This is because we can map Stripe `customer_id`s to their associated dbt Cloud account. We cannot do this with Quickbooks.

{% enddocs %}

{% docs quickbooks_customer %}

A customer is a consumer of the service or product that your business offers. An individual customer can have an underlying nested structure, with a parent customer (the top-level object) having zero or more sub-customers and jobs associated with it.

{% enddocs %}

{% docs quickbooks_invoice %}

An Invoice represents a sales form where the customer pays for a product or service later.

{% enddocs %}