with comp_bands as (

    select * from {{ ref('stg_googlesheets__global_comp_bands') }}

),

synth as (

    select *
    from comp_bands
    where band_rank = 1
        and fiscal_effective_period = 'FY24'

)

select *
from synth