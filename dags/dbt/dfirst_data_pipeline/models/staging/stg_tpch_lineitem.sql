select 
	{{
		dbt_utils.generate_surrogate_key([
			'l_ORDERKEY','l_linenumber'
			])
	}} as ORDER_LINE_KEY,
    l_ORDERKEY as ORDER_KEY,
	l_partkey as PART_KEY,
	l_linenumber as LINE_NUMBER,
	l_quantity as QUANTITY,
	l_extendedprice as EXTENDED_PRICE,
	l_discount as DISCOUNT_PERCENTAGE,
	l_tax as TAX_RATE
from
    {{ source('tpch', 'lineitem') }}
