{{
  config(
    materialized = 'table'
  )
}}

with

source as (

    select * from {{ source('jira', 'issue_board') }}

),

renamed as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'issue_id',
            'board_id'
        ]) }} as issue_board_id,
        issue_id,
        board_id

    from source
    where not _fivetran_deleted

)

select * from renamed