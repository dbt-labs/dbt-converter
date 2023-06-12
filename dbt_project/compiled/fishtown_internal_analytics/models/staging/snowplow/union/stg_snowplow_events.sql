

with unioned as (

    select
        'fishtown'::text as collector,
        app_id as app_id ,
        database_source,
        br_colordepth as br_colordepth ,
        br_cookies as br_cookies ,
        br_family as br_family ,
        br_features_director as br_features_director ,
        br_features_flash as br_features_flash ,
        br_features_gears as br_features_gears ,
        br_features_java as br_features_java ,
        br_features_pdf as br_features_pdf ,
        br_features_quicktime as br_features_quicktime ,
        br_features_realplayer as br_features_realplayer ,
        br_features_silverlight as br_features_silverlight ,
        br_features_windowsmedia as br_features_windowsmedia ,
        br_lang as br_lang ,
        br_name as br_name ,
        br_renderengine as br_renderengine ,
        br_type as br_type ,
        br_version::string as br_version ,
        collector_tstamp::timestamp without time zone as collector_tstamp ,
        contexts ,
        derived_tstamp::timestamp without time zone as derived_tstamp ,
        doc_charset::string as doc_charset ,
        domain_sessionid::string as domain_sessionid ,
        domain_sessionidx::double precision as domain_sessionidx ,
        domain_userid::string as domain_userid ,
        dvce_created_tstamp::timestamp without time zone as dvce_created_tstamp ,
        dvce_ismobile::boolean as dvce_ismobile ,
        dvce_sent_tstamp::timestamp without time zone as dvce_sent_tstamp ,
        dvce_type::string as dvce_type ,
        etl_tstamp::timestamp without time zone as etl_tstamp ,
        event::string as event ,
        event_format::string as event_format ,
        event_id::string as event_id ,
        event_name::string as event_name ,
        event_vendor::string as event_vendor ,
        event_version::string as event_version ,
        nullif(geo_city::string, '') as geo_city ,
        nullif(geo_country::string, '') as geo_country ,
        geo_latitude::double precision as geo_latitude ,
        geo_longitude::double precision as geo_longitude ,
        nullif(geo_region::string, '') as geo_region ,
        nullif(geo_region_name::string, '') as geo_region_name ,
        nullif(geo_timezone::string, '') as geo_timezone ,
        nullif(geo_zipcode::string, '') as geo_zipcode ,
        name_tracker::string as name_tracker ,
        network_userid::string as network_userid ,
        os_family::string as os_family ,
        os_manufacturer::string as os_manufacturer ,
        os_name::string as os_name ,
        nullif(os_timezone::string, '') as os_timezone ,
        page_title::string as page_title ,
        page_url::string as page_url ,
        page_urlfragment::string as page_urlfragment ,
        page_urlhost::string as page_urlhost ,
        page_urlpath::string as page_urlpath ,
        page_urlport::double precision as page_urlport ,
        page_urlscheme::string as page_urlscheme ,
        platform::string as platform ,
        pp_xoffset_max::double precision as pp_xoffset_max ,
        pp_xoffset_min::double precision as pp_xoffset_min ,
        pp_yoffset_max::double precision as pp_yoffset_max ,
        pp_yoffset_min::double precision as pp_yoffset_min ,
        se_action::string as se_action ,
        se_category::string as se_category ,
        se_label::string as se_label ,
        user_fingerprint::string as user_fingerprint ,
        nullif(user_id::string, '') as user_id ,
        user_ipaddress::string as user_ipaddress ,
        v_collector::string as v_collector ,
        v_etl::string as v_etl ,
        v_tracker::string as v_tracker ,
        refr_urlscheme::string as refr_urlscheme ,
        refr_medium::string as refr_medium ,
        refr_urlhost::string as refr_urlhost ,
        refr_urlfragment::string as refr_urlfragment ,
        refr_urlport::double precision as refr_urlport ,
        refr_urlpath::string as refr_urlpath ,
        refr_source::string as refr_source ,
        useragent::string as useragent ,
        page_urlquery::string as page_urlquery ,
        se_property::string as se_property ,
        refr_urlquery::string as refr_urlquery ,
        page_referrer::string as page_referrer ,
        refr_term::string as refr_term ,
        mkt_clickid::string as mkt_clickid ,
        mkt_network::string as mkt_network ,
        ip_isp::string as ip_isp ,
        ip_organization::string as ip_organization ,
        ip_domain::string as ip_domain ,
        ip_netspeed::string as ip_netspeed ,
        null::string as mkt_source ,
        null::string as mkt_medium ,
        null::string as mkt_campaign ,
        null::string as mkt_term ,
        null::string as mkt_content ,
        null::string as sequence_number ,
        null::string as txn_id ,
        null::numeric(18,2) as se_value ,
        null::string as tr_orderid ,
        null::string as tr_affiliation ,
        null::numeric(18,2) as tr_total ,
        null::numeric(18,2) as tr_tax ,
        null::numeric(18,2) as tr_shipping ,
        null::string as tr_city ,
        null::string as tr_state ,
        null::string as tr_country ,
        null::string as ti_orderid ,
        null::string as ti_sku ,
        null::string as ti_name ,
        null::string as ti_category ,
        null::numeric(18,2) as ti_price ,
        null::integer as ti_quantity ,
        null::string as tr_currency ,
        null::string as ti_currency ,
        null::string as browser ,
        null::string as browser_name ,
        null::string as browser_major_version ,
        null::string as browser_minor_version ,
        null::string as browser_build_version ,
        null::string as browser_engine ,
        null::string as browser_language,
        br_viewwidth::double precision as br_viewwidth,
        br_viewheight::double precision as br_viewheight,
        doc_height::double precision as doc_height,
        doc_width::double precision as doc_width,
        dvce_screenwidth::double precision as dvce_screenwidth,
        dvce_screenheight::double precision as dvce_screenheight,
        unstruct_event

    from analytics_dev.dbt_jstein.current_snowplow_event
    where 1=1
    

    
        and collector_tstamp >= dateadd(d, -3, current_date)
    
    
    
    
        
            and collector_tstamp >= (select max(collector_tstamp) from analytics_dev.dbt_jstein.stg_snowplow_events)
        
    

    
    




    union all

    select
        'fivetran'::text as collector,
        app_id::string as app_id ,
        'cloud' as database_source,
        br_colordepth::string as br_colordepth ,
        br_cookies::boolean as br_cookies ,
        br_family::string as br_family ,
        br_features_director::boolean as br_features_director ,
        br_features_flash::boolean as br_features_flash ,
        br_features_gears::boolean as br_features_gears ,
        br_features_java::boolean as br_features_java ,
        br_features_pdf::boolean as br_features_pdf ,
        br_features_quicktime::boolean as br_features_quicktime ,
        br_features_realplayer::boolean as br_features_realplayer ,
        br_features_silverlight::boolean as br_features_silverlight ,
        br_features_windowsmedia::boolean as br_features_windowsmedia ,
        br_lang::string as br_lang ,
        br_name::string as br_name ,
        br_renderengine::string as br_renderengine ,
        br_type::string as br_type ,
        br_version::string as br_version ,
        collector_tstamp::timestamp without time zone as collector_tstamp ,
        null::variant as contexts ,
        derived_tstamp::timestamp without time zone as derived_tstamp ,
        doc_charset::string as doc_charset ,
        domain_sessionid::string as domain_sessionid ,
        domain_sessionidx::double precision as domain_sessionidx ,
        domain_userid::string as domain_userid ,
        dvce_created_tstamp::timestamp without time zone as dvce_created_tstamp ,
        dvce_ismobile::boolean as dvce_ismobile ,
        dvce_sent_tstamp::timestamp without time zone as dvce_sent_tstamp ,
        dvce_type::string as dvce_type ,
        etl_tstamp::timestamp without time zone as etl_tstamp ,
        event::string as event ,
        event_format::string as event_format ,
        event_id::string as event_id ,
        event_name::string as event_name ,
        event_vendor::string as event_vendor ,
        event_version::string as event_version ,
        nullif(geo_city::string, '') as geo_city ,
        nullif(geo_country::string, '') as geo_country ,
        geo_latitude::double precision as geo_latitude ,
        geo_longitude::double precision as geo_longitude ,
        nullif(geo_region::string, '') as geo_region ,
        nullif(geo_region_name::string, '') as geo_region_name ,
        nullif(geo_timezone::string, '') as geo_timezone ,
        nullif(geo_zipcode::string, '') as geo_zipcode ,
        name_tracker::string as name_tracker ,
        network_userid::string as network_userid ,
        os_family::string as os_family ,
        os_manufacturer::string as os_manufacturer ,
        os_name::string as os_name ,
        nullif(os_timezone::string, '') as os_timezone ,
        page_title::string as page_title ,
        page_url::string as page_url ,
        page_urlfragment::string as page_urlfragment ,
        page_urlhost::string as page_urlhost ,
        page_urlpath::string as page_urlpath ,
        page_urlport::double precision as page_urlport ,
        page_urlscheme::string as page_urlscheme ,
        platform::string as platform ,
        pp_xoffset_max::double precision as pp_xoffset_max ,
        pp_xoffset_min::double precision as pp_xoffset_min ,
        pp_yoffset_max::double precision as pp_yoffset_max ,
        pp_yoffset_min::double precision as pp_yoffset_min ,
        se_action::string as se_action ,
        se_category::string as se_category ,
        se_label::string as se_label ,
        user_fingerprint::string as user_fingerprint ,
        nullif(user_id::string, '') as user_id ,
        user_ipaddress::string as user_ipaddress ,
        v_collector::string as v_collector ,
        null::string as v_etl ,
        v_tracker::string as v_tracker ,
        refr_urlscheme::string as refr_urlscheme ,
        refr_medium::string as refr_medium ,
        refr_urlhost::string as refr_urlhost ,
        refr_urlfragment::string as refr_urlfragment ,
        refr_urlport::double precision as refr_urlport ,
        refr_urlpath::string as refr_urlpath ,
        refr_source::string as refr_source ,
        useragent::string as useragent ,
        page_urlquery::string as page_urlquery ,
        se_property::string as se_property ,
        refr_urlquery::string as refr_urlquery ,
        page_referrer::string as page_referrer ,
        refr_term::string as refr_term ,
        mkt_clickid::string as mkt_clickid ,
        mkt_network::string as mkt_network ,
        ip_isp::string as ip_isp ,
        ip_organization::string as ip_organization ,
        ip_domain::string as ip_domain ,
        ip_netspeed::string as ip_netspeed ,
        mkt_source::string as mkt_source ,
        mkt_medium::string as mkt_medium ,
        mkt_campaign::string as mkt_campaign ,
        mkt_term::string as mkt_term ,
        mkt_content::string as mkt_content ,
        sequence_number::string as sequence_number ,
        txn_id::string as txn_id ,
        se_value::numeric(18,2) as se_value ,
        tr_orderid::string as tr_orderid ,
        tr_affiliation::string as tr_affiliation ,
        tr_total::numeric(18,2) as tr_total ,
        tr_tax::numeric(18,2) as tr_tax ,
        tr_shipping::numeric(18,2) as tr_shipping ,
        tr_city::string as tr_city ,
        tr_state::string as tr_state ,
        tr_country::string as tr_country ,
        ti_orderid::string as ti_orderid ,
        ti_sku::string as ti_sku ,
        ti_name::string as ti_name ,
        ti_category::string as ti_category ,
        ti_price::numeric(18,2) as ti_price ,
        ti_quantity::integer as ti_quantity ,
        tr_currency::string as tr_currency ,
        ti_currency::string as ti_currency ,
        browser::string as browser ,
        browser_name::string as browser_name ,
        browser_major_version::string as browser_major_version ,
        browser_minor_version::string as browser_minor_version ,
        browser_build_version::string as browser_build_version ,
        browser_engine::string as browser_engine ,
        browser_language::string as browser_language,
        br_viewwidth::double precision as br_viewwidth,
        br_viewheight::double precision as br_viewheight,
        doc_height::double precision as doc_height,
        doc_width::double precision as doc_width,
        dvce_screenwidth::double precision as dvce_screenwidth,
        dvce_screenheight::double precision as dvce_screenheight,
        null::variant as unstruct_event

    from analytics_dev.dbt_jstein.historical_snowplow_event
    where 1=1
    

    
        and collector_tstamp >= dateadd(d, -3, current_date)
    
    
    
    
        
            and collector_tstamp >= (select max(collector_tstamp) from analytics_dev.dbt_jstein.stg_snowplow_events)
        
    

    
    




),

-- The below CTE is used to flag out dev/test events coming from two sources:
-- The dev team testing dbt Cloud features
-- the frontend team testing website features
dev_events_flag as (

    select
        *,

        case
            when page_urlhost ilike any (
                '%cloud.getdbt.local%',
                '%localhost%',
                '%deploy-preview%',
                '%netlify.app%',
                '%staging.cloud.getdbt%',
                '%nkgrok.io%',
                '%app.sinterdata.local%'
            ) then true

            when page_urlquery ilike any (
                '%gtm_debug%'
            ) then true

            else false

        end as is_dev_event

    from unioned

),

deduped as (

    select
        *,

        
    
md5(cast(coalesce(cast(geo_city as TEXT), '') || '-' || coalesce(cast(geo_region as TEXT), '') || '-' || coalesce(cast(geo_region_name as TEXT), '') || '-' || coalesce(cast(geo_country as TEXT), '') as TEXT)) as city_id,

        row_number() over (partition by event_id order by collector_tstamp) as _dedupe
 
    from dev_events_flag
    qualify _dedupe = 1

)

select * from deduped