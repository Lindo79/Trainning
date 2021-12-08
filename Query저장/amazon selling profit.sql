SELECT date_event AS 'date_issued',type_fba_order.name AS 'type_Order',
doc_sku_name.num_sku AS 'num_sku',doc_prod_num.product_num AS 'num_product',qty,
doc_prod_num2.repeat_num AS 'num_repeat',

CASE
	WHEN x=1 THEN '매출액'
    WHEN x=2 THEN '사입비용'
    WHEN x=3 THEN '물류운임'
    WHEN x=4 THEN '물류관세'
    WHEN x=5 THEN '물류기타'
    WHEN x=6 THEN '물류보관'
    WHEN x=7 THEN 'FBA기타'
    WHEN x=8 THEN 'FBA수수료'
    WHEN x=9 THEN '영업이익'
END 'Item',

CASE
	WHEN x=1 THEN num_p_sales+num_p_promotion
    WHEN x=2 THEN doc_prod_num3.val_buying*qty
    WHEN x=3 THEN doc_sku_name.val_freight*qty
    WHEN x=4 THEN doc_sku_name.val_duty*qty
    WHEN x=5 THEN doc_sku_name.val_dest*qty
    WHEN x=6 THEN doc_sku_name.val_storage
    WHEN x=7 THEN num_p_shipping_credit+num_p_gift_credit+num_m_other
    WHEN x=8 THEN ROUND(num_m_selling_fee+num_m_fba_fees,2)*-1
    WHEN x=9 THEN ROUND((num_p_sales+num_p_promotion)-(doc_prod_num3.val_buying*qty)-(doc_sku_name.val_freight*qty)-
    (doc_sku_name.val_duty*qty)-(doc_sku_name.val_dest*qty)-(doc_sku_name.val_storage)-
    (num_p_shipping_credit+num_p_gift_credit+num_m_other)-
    (ROUND(num_m_selling_fee+num_m_fba_fees,2)*-1),2)
END 'Amount'

FROM (
SELECT * FROM doc_monthly_transaction a,
(SELECT 1 AS x
UNION ALL SELECT 2 AS x
UNION ALL SELECT 3 AS x
UNION ALL SELECT 4 AS x
UNION ALL SELECT 5 AS x
UNION ALL SELECT 6 AS x
UNION ALL SELECT 7 AS x
UNION ALL SELECT 8 AS x
UNION ALL SELECT 9 AS x) b
) a

LEFT OUTER JOIN type_fba_order ON type_fba_order_id = type_fba_order.id
LEFT OUTER JOIN doc_sku_name ON doc_sku_name_id = doc_sku_name.id
LEFT OUTER JOIN doc_prod_num ON doc_sku_name.doc_prod_num_id = doc_prod_num.id
LEFT OUTER JOIN doc_prod_num doc_prod_num2 ON doc_sku_name.doc_prod_num_id = doc_prod_num2.id
LEFT OUTER JOIN doc_prod_num doc_prod_num3 ON doc_sku_name.doc_prod_num_id = doc_prod_num3.id
LEFT OUTER JOIN doc_prod_num doc_prod_num4 ON doc_sku_name.doc_prod_num_id = doc_prod_num4.id
LEFT OUTER JOIN doc_prod_hs_num ON doc_sku_name.doc_prod_num_id = doc_prod_hs_num.id
WHERE doc_sku_name_id > '0' AND (type_fba_order_id = '1' OR type_fba_order_id = '5')
ORDER BY doc_sku_namE_id ASC;