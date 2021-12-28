SELECT DISTINCT num_bl AS 'num_BL',
doc_prod_num.id AS 'prod_id',name_fg_color.id AS 'Color_id',name_fg_size.id AS 'Size_id'
FROM doc_fg_logistics
LEFT OUTER JOIN doc_fg_inv ON doc_fg_inv_id = doc_fg_inv.id
LEFT OUTER JOIN doc_fg_inv_detail ON doc_fg_inv.id = doc_fg_inv_detail.doc_fg_inv_id
LEFT OUTER JOIN doc_fg_po_detail ON doc_fg_inv_detail.doc_fg_po_detail_id = doc_fg_po_detail.id
LEFT OUTER JOIN name_fg_color ON doc_fg_po_detail.name_fg_color_id = name_fg_color.id
LEFT OUTER JOIN name_fg_size ON doc_fg_po_detail.name_fg_size_id = name_fg_size.id
LEFT OUTER JOIN doc_prod_num ON doc_fg_po_detail.doc_prod_num_id = doc_prod_num.id