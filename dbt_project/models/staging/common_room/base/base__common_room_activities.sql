-- since Common Room data is uploaded weekly to a Google Drive folder
-- we needed to union all of these datasets together to create one table
-- the below will union any table with 'ACTIVITY' in the name

{% set activity_relations = dbt_utils.get_relations_by_pattern(
        'FIVETRAN_GOOGLE_DRIVE_COMMON_ROOM',
        '%ACTIVITY%',
        database = 'RAW'
    )
%}

{{ dbt_utils.union_relations(relations = activity_relations) }}