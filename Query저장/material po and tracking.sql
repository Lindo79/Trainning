SELECT type_team.name AS 'name_team',doc_design_cover.no_indent,name_company.name AS 'name_brand',name_company2.name AS 'name_supplier',
name_usage.name AS 'name_usage',IF(num_item IS NULL,'',num_item) AS 'num_item',IF(name_description IS NULL,'',name_description) AS 'Description',
IF(name_item_color.name IS NULL,'',name_item_color.name) AS 'Item_Color',
IF(name_item_size.name IS NULL,'',name_item_size.name) AS 'Item_Size',
b.val_unit_price AS 'val_unit_price',doc_num_material_po.num_material_po AS 'num_material_po',
IF(b.val_unit_price IS NULL,0,b.val_unit_price)*IF(value_group>0,ROUND((qty_fg*value_yy)/value_group,2),ROUND(qty_fg*value_yy,2)) AS 'est_amount',
IF(b.val_unit_price IS NULL,0,b.val_unit_price)*IF(value_group>0,ROUND((doc_num_material_po.qty_final_order*value_yy)/value_group,2),
ROUND(doc_num_material_po.qty_final_order*value_yy,2)) AS 'final_amount',
doc_tracking.num_bl AS 'num_bl',type_shipmode.name AS 'ship_mode',IF(doc_tracking.date_etd='0000-00-00','',doc_tracking.date_etd) AS 'ETD',
IF(doc_tracking.date_eta='0000-00-00','',doc_tracking.date_eta) AS 'ETA',doc_num_material_po.creted_ts AS 'date_issued_material',
a.qty_fg AS 'qty_order',doc_num_material_po.qty_final_order AS 'qty_final',
doc_num_invoice.num_invoice AS 'num_invoice',doc_num_invoice.qty_actual AS 'qty_shipped',
ROUND(doc_num_invoice.qty_actual*doc_num_invoice.val_unit_price,2) AS 'act_amount',name_currency.l_code AS 'name_currency',
doc_num_pi.num_pi AS 'num_pi',doc_num_pi.qty_pi AS 'qty_pi',
ROUND(doc_num_pi.qty_pi*doc_num_pi.val_pi_unit_price,2) AS 'pi_amount'

FROM doc_material_checklist a

LEFT OUTER JOIN doc_num_material_po ON a.id = doc_num_material_po.doc_material_checklist_id
LEFT OUTER JOIN name_usage ON a.name_usage_id = name_usage.id
LEFT OUTER JOIN name_material ON a.name_material_id = name_material.id
LEFT OUTER JOIN doc_design_cover ON a.doc_design_cover_id = doc_design_cover.id
LEFT OUTER JOIN type_team ON doc_design_cover.type_team_id = type_team.id
LEFT OUTER JOIN name_company ON doc_design_cover.brand_company_id = name_company.id
LEFT OUTER JOIN name_company name_company2 ON name_material.name_company_id = name_company2.id
LEFT OUTER JOIN name_item_color ON name_material.name_item_color_id = name_item_color.id
LEFT OUTER JOIN name_item_size ON name_material.name_item_size_id = name_item_size.id
LEFT OUTER JOIN doc_num_invoice ON a.id = doc_num_invoice.doc_material_checklist_id AND doc_num_material_po.id = doc_num_invoice.doc_num_material_po_id
LEFT OUTER JOIN doc_tracking ON doc_num_material_po.id = doc_tracking.doc_num_invoice_id
LEFT OUTER JOIN type_shipmode ON doc_tracking.type_shipmode_id = type_shipmode.id
LEFT OUTER JOIN name_currency ON doc_num_invoice.name_currency_id = name_currency.id
LEFT OUTER JOIN doc_num_pi ON a.id = doc_num_pi.doc_material_checklist_id AND doc_num_material_po.id = doc_num_pi.doc_num_material_po_id

LEFT OUTER JOIN (SELECT * FROM
(SELECT CONCAT(name_usage_id,name_material_id,doc_design_cover_id) AS 'key',val_unit_price,updated_ts,ROW_NUMBER() OVER
(PARTITION BY CONCAT(name_usage_id,name_material_id,doc_design_cover_id) ORDER BY updated_ts DESC) AS RankNo
FROM val_unit_price_material) T
WHERE RankNo = 1) b ON
Concat(a.name_usage_id,a.name_material_id, a.doc_design_cover_id) = b.Key;