select 
    ORDERKEY,
	sum(extended_price) as gross_item_sales_amount,
	sum(item_discount_price) as gross_item_discount_price
from
    {{ ref('int_order_items') }} 
group by 
	ORDERKEY