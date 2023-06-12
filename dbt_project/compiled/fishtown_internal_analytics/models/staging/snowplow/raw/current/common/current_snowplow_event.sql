

with

source as (

    select
        'snowpipe' as _source,
        collector_tstamp as _loaded_at,
        *

    from raw.snowplow.event
    where 1=1

    

    
        and collector_tstamp >= dateadd(d, -3, current_date)
    
    
    
    
        
            and collector_tstamp >= (select max(collector_tstamp) from analytics_dev.dbt_jstein.current_snowplow_event)
        
    

    
    




    qualify row_number() over (partition by event_id order by _loaded_at desc) = 1

),

single_tenant_lookup as (

    select * from analytics_dev.dbt_jstein.single_tenant_mappings

),

mt_multi_region as (

    select * from analytics_dev.dbt_jstein.stg_seed__mt_multiregion_mappings

),

joined as (

    select

        coalesce(
            frontend.database_source,
            backend.database_source,
            mt_frontend.database_source,
            mt_backend.database_source,
            'cloud'
        ) as database_source,

        source.*
 
    from source
    left join single_tenant_lookup as backend
        on backend.mapping_field_type = 'ip_address'
        and source.user_ipaddress = backend.mapping_value
    left join single_tenant_lookup as frontend
        on frontend.mapping_field_type = 'url_host'
        and source.page_urlhost = frontend.mapping_value
    left join mt_multi_region as mt_backend
        on mt_backend.mapping_field_type = 'ip_address'
        and source.user_ipaddress = mt_backend.mapping_value
    left join mt_multi_region as mt_frontend
        on mt_frontend.mapping_field_type = 'page_urlhost'
        and source.page_urlhost = mt_frontend.mapping_value

),

user_id_correction as (

    select
        _source,
        _loaded_at,

        database_source,

        case
          when database_source = 'cloud'
                then user_id::varchar
          else md5(database_source || user_id)
      end as user_id_hashed,

      user_id as tenant_user_id_hashed,

        --if this isn't an actual cloud user_id,
        --then use the given user_id. otherewise, hash it
        case
            when try_to_numeric(user_id) is null
                then user_id
            else user_id_hashed
        end as user_id,


        "APP_ID",
  "PLATFORM",
  "ETL_TSTAMP",
  "COLLECTOR_TSTAMP",
  "DVCE_CREATED_TSTAMP",
  "EVENT",
  "EVENT_ID",
  "TXN_ID",
  "NAME_TRACKER",
  "V_TRACKER",
  "V_COLLECTOR",
  "V_ETL",
  "USER_IPADDRESS",
  "USER_FINGERPRINT",
  "DOMAIN_USERID",
  "DOMAIN_SESSIONIDX",
  "NETWORK_USERID",
  "GEO_COUNTRY",
  "GEO_REGION",
  "GEO_CITY",
  "GEO_ZIPCODE",
  "GEO_LATITUDE",
  "GEO_LONGITUDE",
  "GEO_REGION_NAME",
  "IP_ISP",
  "IP_ORGANIZATION",
  "IP_DOMAIN",
  "IP_NETSPEED",
  "PAGE_URL",
  "PAGE_TITLE",
  "PAGE_REFERRER",
  "PAGE_URLSCHEME",
  "PAGE_URLHOST",
  "PAGE_URLPORT",
  "PAGE_URLPATH",
  "PAGE_URLQUERY",
  "PAGE_URLFRAGMENT",
  "REFR_URLSCHEME",
  "REFR_URLHOST",
  "REFR_URLPORT",
  "REFR_URLPATH",
  "REFR_URLQUERY",
  "REFR_URLFRAGMENT",
  "REFR_MEDIUM",
  "REFR_SOURCE",
  "REFR_TERM",
  "MKT_MEDIUM",
  "MKT_SOURCE",
  "MKT_TERM",
  "MKT_CONTENT",
  "MKT_CAMPAIGN",
  "SE_CATEGORY",
  "SE_ACTION",
  "SE_LABEL",
  "SE_PROPERTY",
  "SE_VALUE",
  "TR_ORDERID",
  "TR_AFFILIATION",
  "TR_TOTAL",
  "TR_TAX",
  "TR_SHIPPING",
  "TR_CITY",
  "TR_STATE",
  "TR_COUNTRY",
  "TI_ORDERID",
  "TI_SKU",
  "TI_NAME",
  "TI_CATEGORY",
  "TI_PRICE",
  "TI_QUANTITY",
  "PP_XOFFSET_MIN",
  "PP_XOFFSET_MAX",
  "PP_YOFFSET_MIN",
  "PP_YOFFSET_MAX",
  "USERAGENT",
  "BR_NAME",
  "BR_FAMILY",
  "BR_VERSION",
  "BR_TYPE",
  "BR_RENDERENGINE",
  "BR_LANG",
  "BR_FEATURES_PDF",
  "BR_FEATURES_FLASH",
  "BR_FEATURES_JAVA",
  "BR_FEATURES_DIRECTOR",
  "BR_FEATURES_QUICKTIME",
  "BR_FEATURES_REALPLAYER",
  "BR_FEATURES_WINDOWSMEDIA",
  "BR_FEATURES_GEARS",
  "BR_FEATURES_SILVERLIGHT",
  "BR_COOKIES",
  "BR_COLORDEPTH",
  "BR_VIEWWIDTH",
  "BR_VIEWHEIGHT",
  "OS_NAME",
  "OS_FAMILY",
  "OS_MANUFACTURER",
  "OS_TIMEZONE",
  "DVCE_TYPE",
  "DVCE_ISMOBILE",
  "DVCE_SCREENWIDTH",
  "DVCE_SCREENHEIGHT",
  "DOC_CHARSET",
  "DOC_WIDTH",
  "DOC_HEIGHT",
  "TR_CURRENCY",
  "TR_TOTAL_BASE",
  "TR_TAX_BASE",
  "TR_SHIPPING_BASE",
  "TI_CURRENCY",
  "TI_PRICE_BASE",
  "BASE_CURRENCY",
  "GEO_TIMEZONE",
  "MKT_CLICKID",
  "MKT_NETWORK",
  "ETL_TAGS",
  "DVCE_SENT_TSTAMP",
  "REFR_DOMAIN_USERID",
  "REFR_DVCE_TSTAMP",
  "DOMAIN_SESSIONID",
  "DERIVED_TSTAMP",
  "EVENT_VENDOR",
  "EVENT_NAME",
  "EVENT_FORMAT",
  "EVENT_VERSION",
  "EVENT_FINGERPRINT",
  "TRUE_TSTAMP",
  "UNSTRUCT_EVENT",
  "CONTEXTS"

    from joined

)

select * from user_id_correction