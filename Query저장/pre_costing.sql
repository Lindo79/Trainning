SELECT doc_design_cover.no_indent,name_company.name AS 'name_brand',doc_design_cover.no_design,type_season.name AS 'name_season',
name_season_year.name AS 'year',type_gender.name AS 'name_gender',type_apparel.name AS 'name_division',name_company2.name AS 'name_mid',
type_document.remark AS 'type_doc',

(CASE
	WHEN type_cbd_category.type_material_id > 0 AND type_cbd_category.type_direct_id = 0 AND type_cbd_category.type_indirect_id = 0 THEN type_material.name
    WHEN type_cbd_category.type_material_id = 0 AND type_cbd_category.type_direct_id > 0 AND type_cbd_category.type_indirect_id = 0 THEN type_directcost.name
    WHEN type_cbd_category.type_material_id = 0 AND type_cbd_category.type_direct_id = 0 AND type_cbd_category.type_indirect_id > 0 THEN type_indirectcost.name
END) AS 'name_cbd_category',a.value_total,
ROUND(b.qty_total/7,0) AS 'qty_ttl',ROUND(b.amount_ttl/7,2) AS 'amount_ttl',ROUND(ROUND(b.amount_ttl/7,2)/ROUND(b.qty_total/7,0),2) AS 'unit_price'

FROM doc_cbd_summary a
LEFT OUTER JOIN doc_design_cover ON a.doc_design_cover_id = doc_design_cover.id
LEFT OUTER JOIN name_company ON doc_design_cover.brand_company_id = name_company.id
LEFT OUTER JOIN type_season ON doc_design_cover.type_season_id = type_season.id
LEFT OUTER JOIN name_season_year ON doc_design_cover.name_season_y_id = name_season_year.id
LEFT OUTER JOIN type_gender ON doc_design_cover.type_gender_id = type_gender.id
LEFT OUTER JOIN type_apparel ON doc_design_cover.type_apparel_id = type_apparel.id
LEFT OUTER JOIN name_company name_company2 ON doc_design_cover.mid_comp_id = name_company2.id
LEFT OUTER JOIN type_document ON a.type_document_id = type_document.id
LEFT OUTER JOIN type_cbd_category ON a.type_cbd_category_id = type_cbd_category.id
LEFT OUTER JOIN type_material ON type_cbd_category.type_material_id = type_material.id
LEFT OUTER JOIN type_directcost ON type_cbd_category.type_direct_id = type_directcost.id
LEFT OUTER JOIN type_indirectcost ON type_cbd_category.type_indirect_id = type_indirectcost.id
LEFT OUTER JOIN (SELECT design_cover_id,SUM(qty_order) AS 'qty_total',ROUND(SUM(qty_order*unit_price),0) AS 'amount_ttl'
FROM doc_fg_po GROUP BY design_cover_id) b
ON b.design_cover_id = a.doc_design_cover_id;