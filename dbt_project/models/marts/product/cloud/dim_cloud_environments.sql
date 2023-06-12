with

environments as (

    select * from {{ ref('stg_cloud__environments') }}

),

environment_variables as (

    select * from {{ ref('stg_cloud__environment_variables') }}
    where precedence_level in ('environment', 'project')
      and is_env_var_deleted = 0

),

environment_var_spine as (

    select
        environments.environment_id,
        {{ dbt_utils.star(
            from=ref('stg_cloud__environment_variables'), 
            except=[
                "ENVIRONMENT_ID"
            ],
            relation_alias='env_vars_proj'
        ) }}
    from environments
    left join environment_variables as env_vars_proj
        on env_vars_proj.project_id = environments.project_id
        and env_vars_proj.account_id = environments.account_id
        and env_vars_proj.precedence_level = 'project'
    
    union all

    select
        environments.environment_id,
        {{ dbt_utils.star(
            from=ref('stg_cloud__environment_variables'), 
            except=[
                "ENVIRONMENT_ID"
            ],
            relation_alias='env_vars_env'
        ) }}
    from environments
    left join environment_variables as env_vars_env
        on env_vars_env.project_id = environments.project_id
        and env_vars_env.account_id = environments.account_id
        and env_vars_env.environment_id = environments.environment_id
        and env_vars_env.precedence_level = 'environment'

),

environment_overrides as (

    select
        project_id,
        account_id,
        environment_id,
        name,
        value
    
    from environment_var_spine
    qualify row_number() over (
        partition by project_id, account_id, environment_id, name
        order by precedence_ranking
    ) = 1
    -- For environment variables, we want to use the `precedence_ranking` to prioritize
    -- which variable type we should take precedence per environment
    -- For example, if an environment has a variable both at the project and,
    -- environment level, then we want to prioritize the environment type first
    --(see `precedence_ranking` description in the `stg_cloud__environment_variables` model).
),

env_vars_summarized as (

    select
        environment_id,
        project_id,
        account_id,
        count(*) as count_environment_variables,
        array_agg(name) as configured_environment_variables,
        array_agg( name || ':' || value) as environment_variables_list
    
    from environment_overrides
    group by 1,2,3

),

final as (

    select
        environments.*,
        coalesce(
            env_vars_summarized.count_environment_variables,
            0
        ) as count_environment_variables,
        env_vars_summarized.configured_environment_variables,
        env_vars_summarized.environment_variables_list

    from environments
    left join env_vars_summarized using (environment_id, account_id, project_id)

)

select * from final

