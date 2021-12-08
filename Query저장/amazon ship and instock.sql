SELECT doc_prod_num.product_num AS 'num_Product',doc_prod_num2.repeat_num AS 'num_product_repeat',doc_prod_num3.id_product_num AS 'id_prod_num',
name_fg_color.name AS 'Color',name_fg_color2.id AS 'Color_id',name_fg_size.name AS 'Size',name_fg_size2.id AS 'Size_id',
doc_fg_inv_detail.qty_shipped AS 'qty_ship',doc_fg_inv_detail.unit_price_shipped AS 'price_retail',
doc_prod_cbd.val_buying AS 'price_buying',doc_prod_cbd2.val_tv AS 'price_tv',doc_fg_inv_detail.date_inhouse AS 'date_inhouse'
FROM doc_fg_inv_detail
LEFT OUTER JOIN doc_fg_po_detail ON doc_fg_inv_detail.doc_fg_po_detail_id = doc_fg_po_detail.id
LEFT OUTER JOIN doc_prod_num ON doc_fg_po_detail.doc_prod_num_id = doc_prod_num.id
LEFT OUTER JOIN doc_prod_num doc_prod_num2 ON doc_fg_po_detail.doc_prod_num_id = doc_prod_num2.id
LEFT OUTER JOIN doc_prod_num doc_prod_num3 ON doc_fg_po_detail.doc_prod_num_id = doc_prod_num3.id
LEFT OUTER JOIN name_fg_color ON doc_fg_po_detail.name_fg_color_id = name_fg_color.id
LEFT OUTER JOIN name_fg_color name_fg_color2 ON doc_fg_po_detail.name_fg_color_id = name_fg_color2.id
LEFT OUTER JOIN name_fg_size ON doc_fg_po_detail.name_fg_size_id = name_fg_size.id
LEFT OUTER JOIN name_fg_size name_fg_size2 ON doc_fg_po_detail.name_fg_size_id = name_fg_size2.id
LEFT OUTER JOIN doc_prod_cbd ON doc_fg_po_detail.doc_prod_num_id = doc_prod_cbd.id
LEFT OUTER JOIN doc_prod_cbd doc_prod_cbd2 ON doc_fg_po_detail.doc_prod_num_id = doc_prod_cbd2.id;