select 
    orders.*,
	order_items_summary.gross_item_sales_amount,
	order_items_summary.gross_item_discount_price
from
    {{ ref('stg_tpch_orders') }} as orders 
join 
	{{ ref('int_order_items_summary') }} as order_items_summary 
on orders.ORDERKEY = order_items_summary.ORDERKEY
order by orders.ORDERDATE
