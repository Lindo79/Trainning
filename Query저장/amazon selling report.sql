SELECT date_event AS 'date_issued',type_fba_order.name AS 'type_Order',
doc_sku_name.num_sku AS 'num_sku',doc_prod_num.product_num AS 'num_product',qty,
doc_prod_num2.repeat_num AS 'num_repeat',doc_prod_num3.val_buying*qty AS 'amount_buying',
num_p_sales+num_p_promotion AS 'Amount_Sales',
num_p_shipping_credit+num_p_gift_credit+num_m_other AS 'Amount_ETC',
ROUND(num_m_selling_fee+num_m_fba_fees,2) AS 'Amount_Fees',
doc_sku_name.val_freight*qty AS 'Freight',
doc_sku_name.val_duty*qty AS 'Duty',
doc_sku_name.val_dest*qty AS 'Dest',
doc_sku_name.val_storage AS 'storage'
FROM doc_monthly_transaction
LEFT OUTER JOIN type_fba_order ON type_fba_order_id = type_fba_order.id
LEFT OUTER JOIN doc_sku_name ON doc_sku_name_id = doc_sku_name.id
LEFT OUTER JOIN doc_prod_num ON doc_sku_name.doc_prod_num_id = doc_prod_num.id
LEFT OUTER JOIN doc_prod_num doc_prod_num2 ON doc_sku_name.doc_prod_num_id = doc_prod_num2.id
LEFT OUTER JOIN doc_prod_num doc_prod_num3 ON doc_sku_name.doc_prod_num_id = doc_prod_num3.id
LEFT OUTER JOIN doc_prod_num doc_prod_num4 ON doc_sku_name.doc_prod_num_id = doc_prod_num4.id
LEFT OUTER JOIN doc_prod_hs_num ON doc_sku_name.doc_prod_num_id = doc_prod_hs_num.id
WHERE doc_sku_name_id > '0' AND (type_fba_order_id = '1' OR type_fba_order_id = '5')
ORDER BY doc_sku_namE_id ASC