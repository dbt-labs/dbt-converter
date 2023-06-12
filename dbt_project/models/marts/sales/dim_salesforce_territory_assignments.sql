{# SFDC user id fields for territory assignments. May also need to update territory_role case statement in Final CTE #}
{%- set sales_ids = ['commercial_sd', 'enterprise_sd'] -%}

with

territories as (

    select * from {{ ref('stg_salesforce__territories') }}

),

users as (

    select * from {{ ref('stg_salesforce__users') }}

),

{%- for sales_id in sales_ids %}

    {{ sales_id }} as (

        select
            {{ sales_id }}_id as territory_user_id, 
            initcap('{{ sales_id.split('_')[0] }}') as territory_segment,
            '{{ sales_id.split('_')[1] }}' as territory_role,
            territory_theater,
            territory_region,
            territory_subregion,
            territory_name,
            territory_group,
            territory_pod

        from territories

    ),

{% endfor -%}

unioned as (

    {%- for sales_id in sales_ids %}

        select * from {{ sales_id }}
        {% if not loop.last %}union{% endif %}

    {% endfor -%}

),

final as (

    select

        {{ dbt_utils.generate_surrogate_key([
            'users.name',
            'unioned.territory_segment',
            'unioned.territory_region',
            'unioned.territory_name'

        ]) }} as territory_assignments_id,
        users.name as territory_user_name,
        users.adp_associate_id,

        unioned.territory_segment,
        unioned.territory_theater,
        unioned.territory_region,
        unioned.territory_subregion,
        unioned.territory_name,
        unioned.territory_group,
        unioned.territory_pod,

        case
            when unioned.territory_role = 'sd'
                then 'Sales Director'
            else unioned.territory_role
        end as territory_role

    from unioned
    left join users
        on unioned.territory_user_id = users.user_id

)

select * from final
