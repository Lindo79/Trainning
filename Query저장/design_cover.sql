SELECT doc_design_cover.id,name_company.name AS 'Vendor_name',type_dept.name_kor AS 'Dept_name',type_team.name AS 'Team_name',doc_design_cover.status AS 'status',
doc_design_cover.no_indent,name_company2.name,doc_design_cover.no_design,type_season.name AS 'Season_name',
name_season_year.name AS 'Season_Year',type_gender.name AS 'Gender',type_fabric_main.name AS 'Main_Fabric',
type_apparel.name AS 'Garment_name',type_order.name AS 'Order_Type',type_order_detail.name AS 'Order_Option',
name_company3.name AS 'Manufacturer',doc_design_cover.remark,doc_design_cover.creted_ts
FROM doc_design_cover
LEFT OUTER JOIN name_company ON doc_design_cover.vendor_comp_id = name_company.id
LEFT OUTER JOIN type_dept ON doc_design_cover.type_dept_id = type_dept.id
LEFT OUTER JOIN type_team ON doc_design_cover.type_team_id = type_team.id
LEFT OUTER JOIN name_company name_company2 ON doc_design_cover.brand_company_id = name_company2.id
LEFT OUTER JOIN type_season ON doc_design_cover.type_season_id = type_season.id
LEFT OUTER JOIN name_season_year ON doc_design_cover.name_season_y_id = name_season_year.id
LEFT OUTER JOIN type_gender ON doc_design_cover.type_gender_id = type_gender.id
LEFT OUTER JOIN type_fabric_main ON doc_design_cover.type_fabric_main_id = type_fabric_main.id
LEFT OUTER JOIN type_apparel ON doc_design_cover.type_apparel_id = type_apparel.id
LEFT OUTER JOIN type_order ON doc_design_cover.type_order_id = type_order.id
LEFT OUTER JOIN type_order_detail ON doc_design_cover.type_order_detail_id = type_order_detail.id
LEFT OUTER JOIN name_company name_company3 ON doc_design_cover.mid_comp_id = name_company3.id;