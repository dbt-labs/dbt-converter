{% docs src_xactly %}
**Status:** Active 

Xactly is a sales operations tool that we use to track attainment, commissions, and quotas. The data from this tool is important for payroll-related activities and will eventually be used for payroll-automation using Snowflake and dbt.

While this source does not currently surface any sensitive data, it will in the short term and is thus being handled as a sensitive source.

Data from this platform is loaded using custom `insert` statements in the Connect-portion of the Xactly tool. Data currently refreshes daily. There is in-application versioning of the insert queries, but we will also document them per-table in the dbt project.

{% enddocs %}

{% docs xactly_credits %}
This table is created on a daily schedule with a pipeline in Xactly Connect:

Xactly step: snowflake_truncate_credits_table
```
delete from Snowflake(
    TableName='CREDITS',
    CredentialName='snowflake_credential',
    Passthrough=true
)
where 1=1;
```

Xactly step: snowflake_insert_credits_table
```
insert into Snowflake(
TableName='CREDITS',
CredentialName='snowflake_credential',
Passthrough=true)

select
	pa.name,
    cast(p.start_date as varchar),
    c.order_code,
    c.amount,
    c.credit_type_name,
    c.credit_type_id,
    pta.title_name,
    case
    	when pta.title_id in (
        	'4368309903',
        	'4381269688',
        	'4612385347',
        	'4586567872',
        	'4612385344',
        	'4612385331',
        	'4612385324',
        	'4569500676',
        	'4612385328',
        	'4765656914',
        	'4612385351'
        )
        	then 'Sales Director'
         else 'Sales Manager'
	end
    
from xc_credit c
join xc_period p
    on p.period_id = c.period_id
join xc_participant pa
    on pa.participant_id = c.participant_id
join xc_position po
    on po.position_id = c.eff_position_id
join xc_pos_title_assignment pta
    on pta.position_id = po.position_id
where pta.title_id in (
  	'4368309903',
  	'4381269688',
  	'4612385347',
  	'4586567872',
  	'4612385344',
  	'4612385331',
  	'4612385324',
  	'4569500676',
  	'4612385328',
  	'4765656914',
  	'4612385351',
  	'4368309898',
  	'5403573033',
  	'5403572975'
)
and c.credit_type_id in (
	'4368284267',
  	'4368284252',
  	'4368284269',
  	'4368284256',
  	'5250834913',
  	'4368284254'
)
```
{% enddocs %}

{% docs xactly_quotas %}
This table is created on a daily schedule with a pipeline in Xactly Connect:

Xactly step: snowflake_truncate_quotas_table
```
delete from Snowflake(
    TableName='QUOTAS',
    CredentialName='snowflake_credential',
    Passthrough=true
)
where 1=1;
```

Xactly step: snowflake_insert_quotas_table
```
insert into Snowflake(
TableName='QUOTAS',
CredentialName='snowflake_credential',
Passthrough=true)

select
	ppa.participant_name,
    cast(p.start_date as varchar),
    pta.title_name,
    q.name,
    qa.amount,
    p.period_type_id_fk,
    case
    	when pta.title_id in (
        	'4368309903',
        	'4381269688',
        	'4612385347',
        	'4586567872',
        	'4612385344',
        	'4612385331',
        	'4612385324',
        	'4569500676',
        	'4612385328',
        	'4765656914',
        	'4612385351'
        )
        	then 'Sales Director'
         else 'Sales Manager'
	end
    
from xc_quota q
join xc_quota_assignment qa
    on qa.quota_id = q.quota_id
join xc_pos_title_assignment pta
    on pta.position_id = qa.assignment_id
join xc_position po
    on PO.position_id = pta.position_id
join xc_pos_part_assignment ppa
    on ppa.position_id = pta.position_id
join xc_period p
    on p.period_id= qa.period_id
where q.quota_id in (
	'4368310936',
    '4368310937',
    '4586578274',
    '5401203401',
    '5401203462',
    '5401221306'
)
where pta.title_id in (
  	'4368309903',
  	'4381269688',
  	'4612385347',
  	'4586567872',
  	'4612385344',
  	'4612385331',
  	'4612385324',
  	'4569500676',
  	'4612385328',
  	'4765656914',
  	'4612385351',
  	'4368309898',
  	'5403573033',
  	'5403572975'
)
and p.period_type_id_fk ='3276756176'
```
{% enddocs %}

{% docs xactly_payments %}
This table is populated on a monthly basis following the calculation of payments:

Xactly step: snowflake_truncate_payments_table
```
delete from Snowflake(
    TableName='PAYMENTS',
    CredentialName='snowflake_credential',
    Passthrough=true
)
where 1=1;
```

Xactly step: snowflake_insert_payments_table
```
insert into Snowflake(
TableName='PAYMENTS',
CredentialName='snowflake_credential',
Passthrough=true)

select	
    xc_payment.payment_id,	
    xc_payment.participant_id,	
    xc_payment.period_id,	
    xc_payment.earning_group_id,	
    xc_payment.amount_unit_type_id,	
	
    xc_payment.item_code,	
    xc_payment.is_held,	
    xc_payment.is_released,	
    xc_payment.is_final,	
    xc_payment.payment_flag,	
    xc_payment.earning_group_name,	
    xc_payment.comp_earning_group_name,	
    xc_payment.bonus_earning_group_name,	
    xc_participant.name as partcipant_name,	
    xc_participant.payroll_id as participant_payroll_id,	
    xc_participant.department as participant_department,	
    xc_participant.location as participant_location,	
    xc_participant.cost_center as participant_cost_center,	
	
    xc_payment.period_name,	
    cast(xc_period.start_date as varchar) as period_start_date,	
    cast(xc_period.end_date as varchar) as period_end_date,	
    cast(xc_payment.incentive_date as varchar) as incentive_date,	
    cast(xc_payment.release_date as varchar) as release_date,	
	
    xc_payment.amount,	
    xc_unit_type.name as amount_currency_name,	
    xc_unit_type.display_symbol as amount_currency_display_symbol	
	
from xc_payment	
inner join xc_participant	
	on xc_payment.participant_id = xc_participant.participant_id
inner join xc_period	
	on xc_payment.period_id = xc_period.period_id
inner join xc_unit_type	
	on xc_payment.amount_unit_type_id =xc_unit_type.unit_type_id
```
{% enddocs %}