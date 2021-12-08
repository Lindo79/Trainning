SELECT a.id,a.creted_ts,type_dept.name_kor AS 'name_dept',
type_team.name AS 'name_team',doc_design_cover2.no_indent AS 'num_indent',
doc_design_cover3.no_design AS 'num_design',type_season.name AS 'name_season',name_season_year.name AS 'year_season',
type_gender.name AS 'name_gender',type_fabric_main.name AS 'type_fabric',type_apparel.name AS 'type_garment',
type_order.name AS 'type_order',type_order_detail.name AS 'type_option',name_company.name AS 'name_mid',
name_usage.name AS 'name_usage',type_material.name AS 'type_material',name_company2.name AS 'name_supplier',name_company3.name AS 'name_brand',
num_item AS 'num_item',name_description AS 'Description',
IF(name_item_color.name IS NULL,'',name_item_color.name) AS 'Item_Color',
IF(name_item_size.name IS NULL,'',name_item_size.name) AS 'Item_Size',
IF(name_fg_color.name IS NULL,'',name_fg_color.name) AS 'name_fg_color',
qty_fg AS 'qty',value_yy AS 'YY',IF(value_group>0,ROUND((qty_fg*value_yy)/value_group,2),ROUND(qty_fg*value_yy,2)) AS 'qty_order',
IF(b.val_unit_price IS NULL,0,b.val_unit_price) AS 'Unit_Price',
IF(b.val_unit_price IS NULL,0,ROUND(IF(value_group>0,(qty_fg*value_yy)/value_group,qty_fg*value_yy)*b.val_unit_price,2)) AS 'Amount_Order'

FROM doc_material_checklist a

LEFT OUTER JOIN doc_design_cover ON a.doc_design_cover_id = doc_design_cover.id

LEFT OUTER JOIN (SELECT * FROM
(SELECT CONCAT(name_usage_id,name_material_id,doc_design_cover_id) AS 'key',val_unit_price,updated_ts,ROW_NUMBER() OVER
(PARTITION BY CONCAT(name_usage_id,name_material_id,doc_design_cover_id) ORDER BY updated_ts DESC) AS RankNo
FROM val_unit_price_material) T
WHERE RankNo = 1) b ON
Concat(a.name_usage_id,a.name_material_id, a.doc_design_cover_id) = b.Key

LEFT OUTER JOIN name_material ON a.name_material_id = name_material.id
LEFT OUTER JOIN type_dept ON doc_design_cover.type_dept_id = type_dept.id
LEFT OUTER JOIN type_team ON doc_design_cover.type_team_id = type_team.id
LEFT OUTER JOIN doc_design_cover doc_design_cover2 ON a.doc_design_cover_id = doc_design_cover2.id
LEFT OUTER JOIN doc_design_cover doc_design_cover3 ON a.doc_design_cover_id = doc_design_cover3.id
LEFT OUTER JOIN type_season ON doc_design_cover.type_season_id = type_season.id
LEFT OUTER JOIN name_season_year ON doc_design_cover.name_season_y_id = name_season_year.id
LEFT OUTER JOIN type_gender ON doc_design_cover.type_gender_id = type_gender.id
LEFT OUTER JOIN type_fabric_main ON doc_design_cover.type_fabric_main_id = type_fabric_main.id
LEFT OUTER JOIN type_apparel ON doc_design_cover.type_apparel_id = type_apparel.id
LEFT OUTER JOIN type_order ON doc_design_cover.type_order_id = type_order.id
LEFT OUTER JOIN type_order_detail ON doc_design_cover.type_order_detail_id = type_order_detail.id
LEFT OUTER JOIN name_company ON doc_design_cover.mid_comp_id = name_company.id
LEFT OUTER JOIN name_usage ON a.name_usage_id = name_usage.id
LEFT OUTER JOIN type_material ON a.type_material_id = type_material.id
LEFT OUTER JOIN name_fg_color ON a.name_fg_color_id = name_fg_color.id
LEFT OUTER JOIN name_company name_company2 ON name_material.name_company_id = name_company2.id
LEFT OUTER JOIN name_item_color ON name_material.name_item_color_id = name_item_color.id
LEFT OUTER JOIN name_item_size ON name_material.name_item_size_id = name_item_size.id
LEFT OUTER JOIN name_company name_company3 ON doc_design_cover.brand_company_id = name_company3.id;