SELECT num_bl AS 'num_BL',doc_fg_inv.name_invoice AS 'num_Invoice',date_etd,
doc_prod_num.id AS 'prod_id',doc_prod_num.product_num AS 'num_Product',doc_prod_num.repeat_num AS 'num_repeat',
name_fg_color.name AS 'Color',name_fg_size.name AS 'Size',doc_fg_inv_detail.qty_shipped AS 'Qty',
val_freight+doc_fg_logistics.val_freight_other AS 'Freight_charge',
val_clearance AS 'Duty_charge',
val_dest_inland_trucking+val_dest_etc+val_fba_inland_trucking AS 'dest_charge',
val_storage AS 'Storage_charge'
FROM doc_fg_logistics
LEFT OUTER JOIN doc_fg_inv ON doc_fg_inv_id = doc_fg_inv.id
LEFT OUTER JOIN doc_fg_inv_detail ON doc_fg_inv.id = doc_fg_inv_detail.doc_fg_inv_id
LEFT OUTER JOIN doc_fg_po_detail ON doc_fg_inv_detail.doc_fg_po_detail_id = doc_fg_po_detail.id
LEFT OUTER JOIN name_fg_color ON doc_fg_po_detail.name_fg_color_id = name_fg_color.id
LEFT OUTER JOIN name_fg_size ON doc_fg_po_detail.name_fg_size_id = name_fg_size.id
LEFT OUTER JOIN doc_prod_num ON doc_fg_po_detail.doc_prod_num_id = doc_prod_num.id