

with

source as (

    select * from raw.fivetran_jira.epic

),

renamed as (
    
    select 
        id as epic_id,
        key as epic_key,

        name as epic_name,
        summary,
        done as is_done

    from source

)

select * from renamed