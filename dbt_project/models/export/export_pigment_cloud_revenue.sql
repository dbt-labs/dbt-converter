with

transactions as (

    select * from {{ ref('fct_subscription_transactions') }}

),

enhanced as (

	select 	
		date_month as close_month,
		sum(revenue) as mrr,
		sum(revenue)*12 as ending_arr,
		'Self-Serve' as sales_channel

	from transactions
	where lower(category) = 'dbt_cloud'
		and lower(sales_motion) = 'self-service'
	group by 1

)

select * from enhanced