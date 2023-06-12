/*
    The GitHub Stars integration will record duplicates if a user
    stars, unstars, and then stars the repo again. We only care
    about the first time the repo was starred by the user
*/



with

source as (

    select * from raw.github.stargazers

),

renamed as (

    select
        user_id,
        starred_at as first_starred_at,
        user,
        _sdc_repository as repo_name,
        row_number() over (partition by user_id order by starred_at) as star_idx

    from source
    --filtering on the dbt repository
    where repo_name in ('dbt-labs/dbt', 'dbt-labs/dbt-core')

)

select *
from renamed
where star_idx = 1