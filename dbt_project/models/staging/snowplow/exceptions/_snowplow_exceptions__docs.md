{% docs exceptions_2023__v1_4_scheduler_invocations %}
# Incident Information
Please view the [incident Notion document](https://www.notion.so/dbtlabs/Declining-invocations-investigation-99924f70801042049d410898723be7dd?pvs=4) for more details.
## Time Period
January 30, 2023 - May 12, 2023
## Effected Events
Any dbt Cloud scheduled run using dbt major version 1 and minor version 4 (e.g. `1.4.5`, `1.4.6`)

## Impact
For events that match the above criteria, we were only registering 1 invocation per run. This invocation was largely associated with the first invocation (`dbt deps`). Thus, every subsequent command was not being separated as a unique invocation (e.g. `dbt build`, `dbt run`). This resulted in a significant drop in total invocations and total models built for Cloud scheduled runs.

## Examples
**Corrupt Invocations**

| invocation_id | command | se_action | dvce_created_tstamp |
| ------------- | ------- | --------- | ------------------- |
| 12345         | deps    | start     | 2023-02-01 01:23:45 |
| 12345         | deps    | package   | 2023-02-01 01:23:50 |
| 12345         | deps    | end       | 2023-02-01 01:24:10 |
| 12345         | build   | start     | 2023-02-01 01:24:15 |
| 12345         | build   | run_model | 2023-02-01 01:24:30 |
| 12345         | build   | end       | 2023-02-01 01:25:00 |

*When aggregated, this would show 1 invocation, and 0 models built*

**Corrected Invocations**

| invocation_id | command | se_action | dvce_created_tstamp |
| ------------- | ------- | --------- | ------------------- |
| 12345-1       | deps    | start     | 2023-02-01 01:23:45 |
| 12345-1       | deps    | package   | 2023-02-01 01:23:50 |
| 12345-1       | deps    | end       | 2023-02-01 01:24:10 |
| 12345-2       | build   | start     | 2023-02-01 01:24:15 |
| 12345-2       | build   | run_model | 2023-02-01 01:24:30 |
| 12345-2       | build   | end       | 2023-02-01 01:25:00 |

*When aggregated, this would show 2 invocations, and 1 model built*
## Model Information
This model contains 1 row per invocation event for all invocations contained within the April 2023 incident around scheduler invocations in versions 1.4. The output of this model is used to correct the invocation IDs for all steps within a Cloud run, so that they naturally differ between each step. The field used for correction is the `synthetic_invocation_id`. In downstream models, we are utilizing the below pattern to re-classify these events:  

```sql
coalesce(
    synthetic_invocation_id,
    invocation_id
) as invocation_id
```
{% enddocs %}