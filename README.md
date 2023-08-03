The dbt converter is a CLI tool that simplifies the process of migrating from the metrics spec supported in dbt v1.5 and earlier to the metrics specification supported in dbt ≥v1.6.

**Installing dbt converter**

```sql
pip install dbt-metrics-converter
```

**Upgrading to dbt v1.6 spec**

1. Navigate to the root of your dbt project.
2. `pip install dbt-metrics-converter`. Note that the converter requires dbt-core==1.5. You may need to update the version range for the dbt_metrics package.
3. Run `dbtc convert-metrics`. The converter assumes you are in the root of your dbt project. Optionally, you can pass the project path `-dbt-project-path path/to/dbt_project`. NOTE: All metrics must have a timestamp for the upgrade to run. If your metrics do not have a timestamp, add one before running the converter.
4. Semantic models and metrics files will be created in the `semantic_models` and `metrics` directories. Move these folders into your model path.
5. Delete the `metrics` package, move the old metrics configs out of your model path, or delete them.

**Testing your metrics in dbt v1.6**

1. Upgrade to dbt v1.6, and `pip install dbt-metricflow`
2. Remove the old metrics package from your `dbt_packages` and run `dbt clean && dbt deps`. 
3. Run `dbt parse` to generate a semantic manifest
4. View the metrics in your dbt project by running `mf list metrics`
5. Run `mf validate-configs —skip-dw` to validate metrics configs. 
6. To run a test query, run `mf query --metrics <metric_name>`

**Gotchas:**

- Some packages, like fivetran/ad_reporting have metrics defined in them using the v1.5 spec, this may cause an error if you try to run your project after upgrading to v1.6
- Derived metrics are not supported. These will need to be ported manually.
- Make sure to delete any calls of `metrics.calculate` or `metrics.develop` after you've run the conversion script they won’t work without the dbt_metrics package
- Dimension refrences in filters require you to refrence the primary entity i.e {{Dimension('primary_entity__dimension_name')}} However, primary entities we're not part of the old metrics spec so will need to be specified manually. You can learn about [how to add entities to semantic models here](https://docs.getdbt.com/docs/build/entities)
