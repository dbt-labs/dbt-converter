{% docs src_cloud_s3_single_tenant_doc %}
**Status:** Active

The dev-infra team, via the Terraform automations for single-tenant deployments,
supply IP and URL documentation that helps identify which tenant a particular
event or database record comes from. This is stored in an S3 bucket
and has been staged manually in Snowflake. The below describes the process
for how we ingested this data in Snowflake.

### Creating an External Stage for the S3 Bucket
1. Using the role LOADER, created a schema called `cloud_s3_single_tenant_docs`.
1. Created an external stage following [this Snowflake doc](https://docs.snowflake.com/en/sql-reference/sql/create-stage.html#id2)
in the schema mentioned above called `s3_single_tenant_docs`. Credentials are currently stored in 1Password.
1. Permissioned grants to the stage and schema:
```sql
USE ROLE LOADER;
GRANT USAGE ON SCHEMA cloud_s3_single_tenant_docs TO ROLE transformer;
GRANT ALL ON SCHEMA cloud_s3_single_tenant_docs TO ROLE transformer;
GRANT USAGE ON STAGE s3_single_tenant_docs TO ROLE transformer;
```

### Creating an External Table to be Processed into a Staging Table
1. Imported the `dbt_external_tables` package [docs here](https://hub.getdbt.com/dbt-labs/dbt_external_tables/latest/).
1. Created the external table using the package and referenced Snowflake stage.
1. Ran dbt command to create the table in the warehouse: 
`dbt run-operation stage_external_sources --vars "ext_full_refresh: true"`.
This needs to be run each time we want to detect new deployments once added.

### Helpful resources:
* [Terraform source code](https://github.com/dbt-labs/dbt-cloud-infra-single-tenant/blob/master/aws/accounts/dbt-cloud-prod-single-tenant/common-resources/snowflake_s3.tf).
* [Human readable docs for single-tenant configs](https://github.com/dbt-labs/dbt-cloud-single-tenant-docs).
* Snowflake External Table [Reference Doc](https://docs.snowflake.com/en/sql-reference/sql/create-external-table.html).


{% enddocs %}