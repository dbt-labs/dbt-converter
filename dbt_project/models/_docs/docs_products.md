{% docs enriched_product_id %}
A unique identifier generated from the package_product_code and the product_code of a particular product.
This is more robust than the Salesforce Product ID, as a Develop License is currently only a single SKU / 
Salesforce product, but is priced at multiple different points based on the associated package. By comparison,
this field produces a distinct ID for every variation of Develop License. 
{% enddocs %}

{% docs list_price %}
The standard price for the product purchased on a per-unit basis. This may not be reflected in unit prices on specific
contracts. For example, the list price for a develop license may be $300, but the actual contract rate might be $250.
Additionally, the list price for some products (e.g. Develop Licenses) can vary based on the bundle in which the product
is included, despite it being treated as a single SKU. 
{% enddocs %}

{% docs package_product_code %}
The product code associated with the bundle or package into which the given product is grouped. 
e.g. standard, business critical, or virtual private
{% enddocs %}

{% docs product_description %}
A short description of the product. 
{% enddocs %}

{% docs product_family %}
An indicator of the overarching product line of a particular item.
{% enddocs %}

{% docs product_high_discount_threshold %}
The highest end of the discount range allowed before specific revenue treatment is required. 
{% enddocs %}

{% docs product_low_discount_threshold %}
The lowest end of the discount range allowed before specific revenue treatment is required. 
{% enddocs %}

{% docs product_name %}
The human-readable identifier of the product.
{% enddocs %}

{% docs product_name_foreign %}
The human-readable identifier of the associated product.
{% enddocs %}

{% docs product_type %}
An indicator of the overarching product line of a particular item. 
{% enddocs %}

{% docs sfdc_product_code %}
The product code as specified in Salesforce.
Examples include: develop, read, onboarding, service_hour.
This is often combined with Unit to give the full picture of the product.
For example, develop - license.
{% enddocs %}

{% docs ssp_midpoint %}
The midpoint standalone sales price (SSP) is the median sales price at which a given product is sold, if 
typically sold within a range of possible prices.
{% enddocs %}

{% docs ssp_high_percentage %}
The low threshold of the standard ratio of standalone sales price (SSP) to the full list price.
{% enddocs %}

{% docs ssp_low_percentage %}
The high threshold of the standard ratio of standalone sales price (SSP) to the full list price.
{% enddocs %}

{% docs ssp_midpoint_percentage %}
The ratio of the midpoint standalone sales price (SSP) to the full list price.
{% enddocs %}

{% docs sfdc_product_id %}
The Salesforce ID of the product.
{% enddocs %}

{% docs sfdc_product_id_foreign %}
The Salesforce ID of the associated product.
{% enddocs %}

