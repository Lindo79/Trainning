SELECT name_company.name AS 'name_vendor',type_dept.name_eng AS 'name_dept',IF(type_team.name IS NULL,'Lee Intl',type_team.name) AS 'name_team',
name_company2.name AS 'name_brand',type_season.name AS 'name_season',name_season_year.name AS 'year_season',
type_gender.name AS 'name_gender',type_fabric_main.name AS 'name_main_fabric',type_apparel.name AS 'name_apparel',
type_order.name AS 'name_order',type_order_detail.name AS 'name_order_option',IF(name_company3.name IS NULL,'',name_company3.name) AS 'name_factory',
name_country.l_code AS 'CO',IF(ship_date = '0000-00-00','',ship_date) AS 'date_ship',qty_order AS 'qty_ship',unit_price AS 'Unit_price',
qty_order*unit_price AS 'Amount',type_document.id

FROM doc_fg_po
LEFT OUTER JOIN doc_design_cover ON doc_fg_po.design_cover_id = doc_design_cover.id
LEFT OUTER JOIN name_company ON doc_design_cover.vendor_comp_id = name_company.id
LEFT OUTER JOIN name_company name_company2 ON doc_design_cover.brand_company_id = name_company2.id
LEFT OUTER JOIN type_dept ON doc_design_cover.type_dept_id = type_dept.id
LEFT OUTER JOIN type_team ON doc_design_cover.type_team_id = type_team.id
LEFT OUTER JOIN type_season ON doc_design_cover.type_season_id = type_season.id
LEFT OUTER JOIN name_season_year ON doc_design_cover.name_season_y_id = name_season_year.id
LEFT OUTER JOIN type_gender ON doc_design_cover.type_gender_id = type_gender.id
LEFT OUTER JOIN type_fabric_main ON doc_design_cover.type_fabric_main_id = type_fabric_main.id
LEFT OUTER JOIN type_apparel ON doc_design_cover.type_apparel_id = type_apparel.id
LEFT OUTER JOIN type_order ON doc_design_cover.type_order_id = type_order.id
LEFT OUTER JOIN type_order_detail ON doc_design_cover.type_order_detail_id = type_order_detail.id
LEFT OUTER JOIN name_company name_company3 ON doc_design_cover.mid_comp_id = name_company3.id
LEFT OUTER JOIN name_country ON name_company3.name_country_id = name_country.id
LEFT OUTER JOIN type_document ON doc_fg_po.type_document_id = type_document.id
WHERE type_document.id = 1