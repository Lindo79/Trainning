SELECT doc_design_cover.id,name_company.name AS 'Vendor_name',type_dept.name_kor AS 'Dept',IF(type_team.name IS NULL,'',type_team.name) AS 'Team',type_document.name 'Doc_type',
name_company2.name AS 'Brand_name',type_season.name AS 'Season_name',name_season_year.name AS 'Season_year',
type_gender.name AS 'Gender',type_fabric_main.name AS 'Main_fabric',type_apparel.name AS 'Garment_name',
type_order.name AS 'Order_type',type_order_detail.name AS 'Order_option',name_company3.name AS 'MID_name',
name_country.l_code AS 'CO',type_shipmode.name AS 'Ship_mode',doc_fg_po.ship_date,doc_fg_po.qty_order,
doc_fg_po.unit_price,doc_fg_po.status,doc_fg_po.no_style,doc_fg_po.no_po,name_fg_color.name AS 'Color',name_fg_size.name AS 'Size',
doc_fg_po.remark,doc_design_cover.no_indent
FROM doc_fg_po
LEFT OUTER JOIN doc_design_cover ON doc_fg_po.design_cover_id = doc_design_cover.id
LEFT OUTER JOIN name_company ON doc_design_cover.vendor_comp_id = name_company.id
LEFT OUTER JOIN type_dept ON doc_design_cover.type_dept_id = type_dept.id
LEFT OUTER JOIN type_team ON doc_design_cover.type_team_id = type_team.id
LEFT OUTER JOIN type_document ON doc_fg_po.type_document_id = type_document.id
LEFT OUTER JOIN name_company name_company2 ON doc_design_cover.brand_company_id = name_company2.id
LEFT OUTER JOIN type_season ON doc_design_cover.type_season_id = type_season.id
LEFT OUTER JOIN name_season_year ON doc_design_cover.name_season_y_id = name_season_year.id
LEFT OUTER JOIN type_gender ON doc_design_cover.type_gender_id = type_gender.id
LEFT OUTER JOIN type_fabric_main ON doc_design_cover.type_fabric_main_id = type_fabric_main.id
LEFT OUTER JOIN type_apparel ON doc_design_cover.type_apparel_id = type_apparel.id
LEFT OUTER JOIN type_order ON doc_design_cover.type_order_id = type_order.id
LEFT OUTER JOIN type_order_detail ON doc_design_cover.type_order_detail_id = type_order_detail.id
LEFT OUTER JOIN name_company name_company3 ON doc_design_cover.mid_comp_id = name_company3.id
LEFT OUTER JOIN name_country ON name_company3.name_country_id = name_country.id
LEFT OUTER JOIN type_shipmode ON doc_fg_po.type_shipmode_id = type_shipmode.id
LEFT OUTER JOIN name_fg_color ON doc_fg_po.name_fg_color_id = name_fg_color.id
LEFT OUTER JOIN name_fg_size ON doc_fg_po.name_fg_size_id = name_fg_size.id;