select * from 
{{ ref('fact_orders') }}
where gross_item_discount_price > 0