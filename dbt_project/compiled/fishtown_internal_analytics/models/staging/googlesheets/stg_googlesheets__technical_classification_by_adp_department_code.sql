with

source as (

    select * from raw.fivetran_googlesheets.technical_classification_by_adp_department_code

),

renamed as (

    select

        home_department_code as cost_center_code,
        org,
        home_department_cost_center_ as department_name,
        technical as technical_classification

    from source

)

select * from renamed