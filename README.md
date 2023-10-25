The dbt converter is a CLI tool that simplifies the process of migrating from the metrics spec supported in dbt v1.5 and earlier to the metrics specification supported in dbt ≥v1.6.

**Installing dbt converter**

```sql
pip install dbt-metrics-converter
```

**Upgrading to dbt v1.6 spec**

1. Navigate to the root of your dbt project.
2. `pip install dbt-metrics-converter`. Note that the converter requires dbt-core==1.5. You may need to update the version range for the dbt_metrics package.
3. Run `dbtc convert-metrics`. The converter assumes you are at the root of your dbt project. Optionally, you can pass the project path `-dbt-project-path path/to/dbt_project`. NOTE: All metrics must have a timestamp for the upgrade to run. If your metrics do not have a timestamp, add one before running the converter.
4. Semantic models and metrics files will be created in the `semantic_models` and `metrics` directories. Move these folders into your model path.
5. Delete the `metrics` package, move the old metrics configs out of your model path, or delete them.

**Testing your metrics in dbt v1.6**

1. Upgrade to dbt v1.6, and `pip install dbt-metricflow`
2. Remove the old metrics package from your `dbt_packages` and run `dbt clean && dbt deps`. 
3. Run `dbt parse` to generate a semantic manifest
4. View the metrics in your dbt project by running `mf list metrics`
5. Run `mf validate-configs —skip-dw` to validate metrics configs. 
6. To run a test query, run `mf query --metrics <metric_name>`

**SQL syntax**

Refer to [Querying the API for metric metadata](https://docs.getdbt.com/docs/dbt-cloud-apis/sl-jdbc#querying-the-api-for-metric-metadata) to access the built-in metadata calls to query metrics and dimensions using the [dbt Semantic Layer API](https://docs.getdbt.com/docs/dbt-cloud-apis/sl-api-overview).

**Gotchas:**

- Some packages, like fivetran/ad_reporting have metrics defined in them using the v1.5 spec, this may cause an error if you try to run your project after upgrading to v1.6
- Derived metrics are not supported. These will need to be ported manually.
- Make sure to delete any calls of `metrics.calculate` or `metrics.develop` after you've run the conversion script they won’t work without the dbt_metrics package
- Dimension references in filters require you to reference the primary entity i.e {{Dimension('primary_entity__dimension_name')}} However, primary entities we're not part of the old metrics spec so will need to be specified manually. You can learn about [how to add entities to semantic models here](https://docs.getdbt.com/docs/build/entities)
- Non-standard metric methods abbreviations will cause the script to fail.  In particular, abbreviating `average` as `avg` will cause the following output at the console:
```
Performance info: target/perf_info.json
'avg'
```
  - Currently supported `method -> measure` types:
    -   `count`
    -   `count_distinct`
    -   `sum`
    -   `average`
    -   `min`
    -   `max`
    -   `median`


**Important note for Databricks users**

If you are using the `dbt-databricks` connector in your project, you will need to temporarily change to the `dbt-spark` connector, in order to resolve some incompatible dependency version conflicts. 

Refer to the [`dbt-spark` adapter documentation](https://docs.getdbt.com/docs/core/connect-data-platform/spark-setup) for more info.

In order to complete that conversion, you will need to:
1. Open your `~/.dbt/profiles.yml` file.
2. Under each adapter:
  - Change `type: databricks` to `type:spark`
  - On the line after `type` add a key: `method: odbc`

Your final config for each adapter should look like this:

```
your_profile_name:
  target: dev
  outputs:
    dev:
      type: spark
      method: odbc
      driver: [path/to/driver]
      schema: [database/schema name]
      host: [yourorg.sparkhost.com]
      organization: [org id]    # Azure Databricks only
      token: [abc123]
      
      # one of:
      endpoint: [endpoint id]
      cluster: [cluster id]
      
      # optional
      port: [port]              # default 443
      user: [user]
      server_side_parameters:
        "spark.driver.memory": "4g" 
```


3. Once your conversion is complete, we recommend changing back to the `dbt-databricks` adapter, including reverting all changes to `~/.dbt/profiles.yml`.
