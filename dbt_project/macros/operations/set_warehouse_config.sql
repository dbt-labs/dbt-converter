{%- macro set_warehouse_config(warehouse_size, full_refresh_size = none) -%}
    {# Store boolean as lower filter breaks is not none test #}
    {%- set has_full_refresh_size = full_refresh_size is not none -%}

    {# Sanitize args #}
    {%- set warehouse_size = warehouse_size | lower -%}
    {%- set full_refresh_size = full_refresh_size | lower -%}

    {# Raise warning if incremental arguments are passed for non-incremental model #}
    {%- if execute -%}
        {%- if model.config.materialized != 'incremental' and has_full_refresh_size -%}
            {{ exceptions.warn('An incremental configuration exists in set_warehouse_config for ' + model.name + ' which does not apply to a non-incremental model.') }}
        {%- endif -%}
    {%- endif -%}

    {# Confirm args are valid #}
    {%- set valid_warehouse_sizes = ['medium', 'large', 'xlarge'] -%}
    {%- if warehouse_size not in valid_warehouse_sizes -%}
        {{ exceptions.raise_compiler_error('warehouse_size value must be ' + valid_warehouse_sizes | join(', ')) }}
    {%- endif -%}
    {%- if full_refresh_size not in valid_warehouse_sizes and has_full_refresh_size -%}
        {{ exceptions.raise_compiler_error('full_refresh_size value must be ' + valid_warehouse_sizes | join(', ')) }}
    {%- endif -%}

    {# Warehouse naming convention by environment (CI and dev share larger sizes) #}
    {%- if target.user in ['dbt_cloud_user', 'ci_user'] -%}
        {%- set warehouse_prefix = 'transforming_prod' -%}
    {%- else -%}
        {%- set warehouse_prefix = 'transforming' -%}
    {%- endif -%}

    {# Choose sizing to apply #}
    {%- if not is_incremental() and has_full_refresh_size -%}
        {%- set size_suffix = full_refresh_size -%}
    {%- else -%}
        {%- set size_suffix = warehouse_size -%}
    {%- endif -%}

    {# Apply warehouse naming conventions #}
    {%- if size_suffix == 'medium' -%}
        {{ return(warehouse_prefix) }}
    {%- else -%}
        {{ return(warehouse_prefix + '_' + size_suffix) }}
    {%- endif -%}

{%- endmacro -%}