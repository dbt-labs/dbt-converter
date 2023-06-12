{{
    config(
        secure = true,
        schema = "shared_package_installs",
        post_hook = "{{ share_view(share_name='package_installs') }}",
        persist_docs = {"relation": true}
    )
}}

select * from {{ ref('fct_dbt_package_installs') }}
