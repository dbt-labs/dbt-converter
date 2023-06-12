with

multiselect_field_histories as (

    select * from {{ ref('stg_jira__issue_field_multiselect_histories') }}

),

issue_labels as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'issue_id',
            'field_id'
        ]) }} as issue_label_id,
        issue_id,
        field_value as label_name,
        updated_at

    from multiselect_field_histories
    where field_name = 'Labels'
    and is_active
    

)

select * from issue_labels