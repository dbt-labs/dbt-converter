<!---------- MODEL DOCS ---------->

{% docs netsuite_approvalstatus %}
Source table for Netsuite transaction approval status
Primary Key: id
{% enddocs %}

{% docs stg_netsuite__approvalstatuses %}
Dimension table for Netsuite transaction approval status
Primary Key: approval_status_id
{% enddocs %}

{% docs netsuite_department %}
Source table for departments in Netsuite.  
Primary Key: id
{% enddocs %}

{% docs stg_netsuite__departments %}
Dimension table for departments in Netsuite.  
Primary Key: department_id
{% enddocs %}

{% docs stg_netsuite__departments___department_name_with_parent_names %}
The department name preceded by the names of all of the departments above it in the hierarchy.  

An example of a value in this field is the following:  
**R&D : Design**  
Where **R&D** is the parent department name and **Design** is the department name
{% enddocs %}