{%- macro adp_join_organizational_units(organizational_level) -%}
with

worker_assigned_organizational_units as (

    select * from {{ ref('stg_adp__worker_assigned_organizational_units') }}

),

organizational_units as (

    select * from {{ ref('stg_adp__organizational_units') }}

),

organizational_units_with_workers as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'organizational_units.organizational_unit_id',
            'organizational_units.organizational_unit_name',
            'organizational_units.cost_center_code',
            'worker_assigned_organizational_units.worker_assignment_id',
            'worker_assigned_organizational_units.worker_id'
        ]) }} as check_key,

        organizational_units.organizational_unit_id,
        organizational_units.organizational_unit_name,
        organizational_units.cost_center_code,
        worker_assigned_organizational_units.worker_assignment_id,
        worker_assigned_organizational_units.worker_id
    
    from organizational_units
    left join worker_assigned_organizational_units
        on organizational_units.organizational_unit_id = worker_assigned_organizational_units.organizational_unit_id
    where organizational_units.organizational_level_name = '{{ organizational_level }}'

)

select * from organizational_units_with_workers

{%- endmacro -%}