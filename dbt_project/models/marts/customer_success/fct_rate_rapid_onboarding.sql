with 

raw_responses as (

    select * from {{ ref('stg_googlesheets__rate_ro_raw_responses') }}

),

raw_scores as (

    select * from {{ ref('stg_googlesheets__rate_ro_calculated_scores') }}

),

question_type as (

    select * from {{ ref('stg_seed__rapid_onboarding_question_type') }}

),

score_config as (

    select * from {{ ref('stg_seed__rapid_onboarding_score_config') }}

),

responses as (
    {{ dbt_utils.unpivot(
        relation=ref('stg_googlesheets__rate_ro_raw_responses'),
        exclude=[        
            'rate_rapid_onboarding__survey_response_id',
            'account_id',
            'client_company_name',
            'rapid_onboarding_completed_at',
            'trainer_email_address',
            'gsheet_row',
            '_fivetran_synced'
            ],
        field_name='question',
        value_name='response'
    ) }}
),

scores as (
    {{ dbt_utils.unpivot(
        relation=ref('stg_googlesheets__rate_ro_calculated_scores'),
        exclude=[        
            'rate_rapid_onboarding__survey_response_id',
            'combined_score',
            'ro_questions_score',
            'exit_criteria_score',
            ],
        remove=[
            'account_id',
            'client_company_name',
            'rapid_onboarding_completed_at',
            'trainer_email_address',
            'gsheet_row',
            '_fivetran_synced',
        ],
        field_name='question',
        value_name='score'
    ) }}
),

base_table as (

    select
        -- id and info
        raw_responses.rate_rapid_onboarding__survey_response_id,
        raw_responses.account_id,
        raw_responses.client_company_name,
        raw_responses.rapid_onboarding_completed_at,
        raw_responses.trainer_email_address,

        -- high level scores
        raw_scores.combined_score,
        raw_scores.ro_questions_score,
        raw_scores.exit_criteria_score
    from
        raw_responses
        inner join raw_scores on raw_responses.rate_rapid_onboarding__survey_response_id = raw_scores.rate_rapid_onboarding__survey_response_id

),

final as (

    select
        -- id and info
        {{ dbt_utils.generate_surrogate_key([
            'base_table.rate_rapid_onboarding__survey_response_id', 
            'responses.question'
        ]) }} as rate_rapid_onboarding__survey_question_response_id,
        base_table.rate_rapid_onboarding__survey_response_id,
        base_table.account_id,
        base_table.client_company_name,
        base_table.rapid_onboarding_completed_at,
        base_table.trainer_email_address,

        -- high level scores
        base_table.combined_score,
        base_table.ro_questions_score,
        base_table.exit_criteria_score,

        -- 'general_questions' as question_type,
        question_type.question_type,
        -- unpivoted responses
        lower(responses.question) as question,
            -- # General Questions come through as scores, though input in the
            -- # form is a response, bringing that data in via a seed.
        case
            when question_type.question_type = 'General Questions'
                then score_config.response
                else responses.response
            end as response,
        
            -- # Short Answer questions do not have scores, this is expected
        scores.score
    from
        base_table
        inner join responses
            on base_table.rate_rapid_onboarding__survey_response_id = responses.rate_rapid_onboarding__survey_response_id
        left join question_type
            on lower(responses.question) = question_type.question
        left join scores
            on responses.rate_rapid_onboarding__survey_response_id = scores.rate_rapid_onboarding__survey_response_id
            and responses.question = scores.question
        left join score_config
            on lower(responses.question) = score_config.question
            and scores.score = score_config.score
)

select * from final
