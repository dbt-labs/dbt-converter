select * 
from {{ metrics.calculate(
    metric('ending_headcount'),
    grain='day',
    dimensions=['department_name']
) }}