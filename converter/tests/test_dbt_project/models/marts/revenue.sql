select *
from {{ 
    metrics.calculate(
        metric('revenue'),
        dimensions=['customer_status']
    )
}}