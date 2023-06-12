[comment]: <This is a template to be used for future metric docs>


[comment]: <Metric YAML Config template------------------------------->
{% docs metric_doc_yml_template %}
  - name: okr_#.#.#__<METRIC NAME>
    label: METRIC NAME
    model: ref('<dbt MODEL>')
    description: --'reference markdown doc'--
    tags: ['FY2023 - O###'] --O1/O2/O3/O4 (this is so we can click on the tag and see all related KRs to this objective)

    type: AGG
    sql: FIELD_NAME

    timestamp: <TIMESTAMP>
    time_grains: [day, week, month, quarter, year]

    dimensions: --optional
      - region_category

    filters: --optional
      - field: registration_status
        operator: '='
        value: 'Completed Order'
      
      - field: is_current_year
        operator: 'is'
        value: 'true'

    meta: {
      okr_level: 'Team-Level',
      owner(s): 'Heather Wilson',
      team: 'Marketing'
    }
{% enddocs %}


[comment]: <Metric Markdown template------------------------------->

{% docs metric_documentation_template %}
## Overview
* **Fiscal Year:** 
* **Company Objective:** 
* **Company KR #:**
* **Company KR Name:** 
* **Team KR #:** --optional
* **Team KR Name:** --optional

## Context
_OPTIONAL_

## Definition
Define 

## Calculation
**Sources:**
* **in dbt:** [<MODEL NAME>](https://cloud.getdbt.com/accounts/1/jobs/940/docs/#!/model/model.fishtown_internal_analytics.<MODEL_NAME>)
* **in Looker:** [<NAME> explore](https://fishtown.looker.com/explore/dbtLabs/<EXPLORE_NAME>)

**Formulas:**
* **A**: Net-New Projects that ran an invocation _in dbt Cloud_ in a given week or in the past trailing 7 days
* **B**: Core-Only Projects that ran an invocation _in dbt Cloud_ in a given week or in the past trailing 7 days
* **% of B:** `(A-B)/B`

## Goals for the Quarter
<OPTIONAL>

## Resources
* [Link to Data Asset](https://fishtown.looker.com/looks/<LOOK # HERE>)
* [Link to Googlesheet](<KR GOOGLESHEET LINK HERE>)
* [Link to OKR Doc](<OKR DOC LINK HERE>)

{% enddocs %}