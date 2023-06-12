{% docs web_sessions %}
### Definition
The total number of website sessions on marketing sites that occured during a given time period.
Note: this metric is derived from our page views dataset, since a visitor can traverse multiple sub-domains in a given session.

### Filters
- website domain is one of:
    - getdbt.com (includes discover.getdbt.com)
    - docs.getdbt.com
    - blog.getdbt.com
- visitor is not a dbt Labs employee

### Dimensions
- time period (day, week, month) 
- channel
- sub channel
- sales territory
- market segment
- marketing campaign

---
{% enddocs %}


{% docs account_signups %}
### Definition
The count of new dbt Cloud accounts for a given time period.  

### Filters
- account is not deleted
- account has >= 1 verified users
- account is not a partner training account
- account is not an internal dbt Labs account

### Dimensions
- time period (day, week, month) 
- channel
- employee count range
- market segment
- marketing campaign
- plan_tier
    - note: this is the current plan tier for the account that signed up
- region category
- sign up source  

---
{% enddocs %}


{% docs onboarded_accounts %}
### Definition
The count of dbt Cloud accounts that connected a data warehouse within 14 days of account creation.

### Filters
- the account's first connection date is within 14 days of account creation
- account is not a partner training account
- account is not an internal dbt Labs account

### Dimensions
- time period (day, week, month) 
- channel
- employee count range
- market segment
- marketing campaign
- region category
- sign up source

---
{% enddocs %}


{% docs activated_accounts %}
### Definition
The count of dbt Cloud accounts that have successfully run a dbt Cloud job within 14 days of account creation.

### Filters
- the account's first successful run is within 14 days of account creation
- account is not a partner training account
- account is not an internal dbt Labs account

### Dimensions
- time period (day, week, month) 
- channel
- employee count range
- market segment
- marketing campaign
- region category
- sign up source

---
{% enddocs %}


{% docs account_conversions %}
### Definition
The count of dbt Cloud accounts that have activated within 14 days of account creation and converted to a developer, team, or enterprise plan within 30 days of account creation.

### Filters
- the account's first successful run is within 14 days of account creation
- account upgraded from a `trial` plan to a `developer`, `team`, or `enterprise` plan within 30 days of account creation
- account is not a partner training account
- account is not an internal dbt Labs account

### Dimensions
- time period (day, week, month) 
- channel
- employee count range
- market segment
- marketing campaign
- plan_tier
    - note: this is the plan tier for the account at the time of conversion
- region category
- sign up source

---
{% enddocs %}


{% docs net_new_arr %}
### Definition
The total net new ARR (Land ARR) for dbt Cloud accounts on a team plan.
Note: this will include net new UBP once it becomes available.

### Filters
- subscription change category equals `new`
- account sales motion is `Self-Service`

### Dimensions
- time period (day, week, month) 
- channel
- employee count range
- market segment
- marketing campaign
- plan_tier
- region category
- sign up source

---

{% enddocs %}


