{%- macro parse_sfdc_opp_url(sfdc_opp_url_column) -%}

    case
        when contains({{ sfdc_opp_url_column }}, '_classic')
            then replace(split({{ sfdc_opp_url_column }}, '/')[5]::string, '%2F', '')
        when contains({{ sfdc_opp_url_column }}, 'visualforce')
            then replace(split({{ sfdc_opp_url_column }}, '%')[7]::string, '2F', '')
        when contains({{ sfdc_opp_url_column }}, 'Opportunity')
            then split({{ sfdc_opp_url_column }}, '/')[6]::string
        when contains({{ sfdc_opp_url_column }}, 'Account') or contains({{ sfdc_opp_url_column }}, 'Lead')
            then 'Not SFDC Opp ID'
        else split({{ sfdc_opp_url_column }}, '/')[5]::string
    end

{%- endmacro -%}