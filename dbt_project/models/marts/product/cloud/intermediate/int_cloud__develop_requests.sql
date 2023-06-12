with

source as (
    select *
    from {{ ref('stg_cloud__develop_requests') }}
),

computed_status_exit_category as (
    select
        *,
        case
            when status_name like 'stopped ok'
                then 'Stopped OK'
            when status_message like 'You have not configured any development credentials for this project.%'
                then 'Dev Creds Not Configured'
            when status_message like 'Failed to clone repository%'
                then 'Repo Clone Failure'
            when status_message like 'We could not find an access token to clone your repository.%'
                then 'Repo Access Token Error'
            when status_message like 'Failed to generate an access token%'
                then 'Repo Access Token Error'
            when status_message like 'We ran into an error while fetching an access token to clone your repository.%'
                then 'Repo Access Token Error'
            when status_message like 'You have not configured a connection for this project. Please edit the project and add a connection to continue.%'
                then 'Project Configuration Error'
            when status_message like 'This project does not have a repository associated with it. Please add one and try again.%'
                then 'Project Configuration Error'
            when status_message like 'Password authentication failed. Please check the password and try again.%'
                then 'Password Auth Failure'
            when status_message like 'Could not find all secrets required for OAuth.%'
                then 'OAuth Secrets Failure'
            when status_message like 'You must authenticate with Azure in order to access DevOps repositories.%'
                then 'Azure DevOps Auth Error'
            when status_message like '%SSH%'
                then 'SSH Tunnel Setup Failure'
            when status_message like '%ssh%'
                then 'SSH Tunnel Setup Failure'
            when status_message like 'SSL connection has been closed unexpectedly%'
                then 'SSL Connection Closed Unexpectedly'
            when status_message like '%NoneType%'
                then 'NoneType errors'
            when status_message like '%Bigquery%'
                then 'BiqQuery errors'
            when status_message like '%Snowflake%'
                then 'Snowflake errors'
            when status_message like '%Redshift%'
                then 'Redshift errors'
            when status_message like '%Postgres%'
                then 'Postgres errors'
            when status_message like '%dbt deps%'
                then 'dbt deps errors'
            when status_message like 'The subdirectory%'
                then 'Subdirectory doesnt exist'
            when status_message like '%git%'
                then 'Other git errors'
            when status_message like 'Invalid ip address%'
                then 'Invalid ip address'
            when status_message like 'Tried to use an invalid ip address.%'
                then 'Invalid ip address'
            when status_message like 'write() argument must be str, not None'
                then 'write() argument is None'
            when status_message like 'The repository for this environment has been deleted. Please edit the environment and select a different repository.'
                then 'Environment repo deleted'
            when status_message like 'User authentication failed. Please check the details and try again.'
                then 'User authentication failure'
            else 'not categorized'
        end as status_exit_category
    from source
)

select * from computed_status_exit_category