--To disable this model, set the using_ticket_form_history variable within your dbt_project.yml file to False.


select * 
from raw.fivetran_zendesk.ticket_form_history