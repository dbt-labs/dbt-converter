with

source as (

    select * from {{ source('greenhouse', 'hiring_team') }}

),

augmented as (

    select

        {{ dbt_utils.generate_surrogate_key([
            'job_id',
            'role',
            'user_id'
        ]) }} as job_hiring_team_member_id,

        *

    from source

)


select * from augmented