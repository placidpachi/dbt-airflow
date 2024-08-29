select * from 
{{ ref('fact_orders') }}
where date(ORDERDATE) > current_date()
or date(ORDERDATE) < date('1900-01-01')