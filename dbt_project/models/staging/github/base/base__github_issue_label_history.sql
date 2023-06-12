with

source as (

    select * from {{ source('fivetran_github', 'issue_label_history') }}

),

renamed as (

    select
        issue_id,
        label_id,
        actor_id,
        
        label as label_name,
        
        labeled as is_labeled,
        
        updated_at

    from source

)

select * from renamed