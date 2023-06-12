{% set domain_types = ['business','partner','internal','consumer'] %}

with

account_domains as (

    select * from {{ ref('int_account_domains__aggregated') }}

),

{%- for domain_type in domain_types %}

{{ domain_type }}_domains_ranked as (

    select
        account_id,
        email_domain,
        dense_rank() over (partition by account_id order by count_of_{{ domain_type }}_domain_users desc nulls last) as {{ domain_type }}_domain_rank,
        row_number() over (partition by account_id order by count_of_{{ domain_type }}_domain_users desc nulls last, first_license_created_at) as {{ domain_type }}_domain_created_at_rank

    from account_domains
    where account_level_{{ domain_type }}_domain_users > 0

){{ "," if not loop.last }}

{%- endfor -%},

joined as (

    select
        account_domains.*,
        {% for domain_type in domain_types %}
        count(distinct 
            case
                when {{ domain_type}}_domain_rank = 1 then account_domains.email_domain
        end) over (partition by account_domains.account_id) as count_of_leading_{{ domain_type }}_domains,
        {{ domain_type }}_domains_ranked.{{ domain_type }}_domain_rank,
        {{ domain_type }}_domains_ranked.{{ domain_type }}_domain_created_at_rank{{ ',' if not loop.last }}
        {% endfor %}
        
    from account_domains
    {% for domain_type in domain_types %}
    left join {{ domain_type }}_domains_ranked
        on account_domains.account_id = {{ domain_type }}_domains_ranked.account_id
        and account_domains.email_domain = {{ domain_type }}_domains_ranked.email_domain
    {% endfor %}

)

select * from joined



