select 
    lineitem.ORDER_LINE_KEY,
	lineitem.PART_KEY,
	lineitem.LINE_NUMBER,
	orders.ORDERKEY,
	orders.CUSTKEY,
	orders.ORDERDATE,
	lineitem.EXTENDED_PRICE,
	lineitem.DISCOUNT_PERCENTAGE,
	{{discounted_price('lineitem.extended_price','lineitem.DISCOUNT_PERCENTAGE')}} item_discount_price
from
    {{ ref('stg_tpch_orders') }} as orders 
join 
	{{ ref('stg_tpch_lineitem') }} as lineitem 
on orders.ORDERKEY = lineitem.ORDER_KEY
order by orders.ORDERDATE
