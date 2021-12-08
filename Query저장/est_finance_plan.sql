SELECT name_company.name AS 'name_vendor',type_team.name AS 'name_team',name_company2.name AS 'name_brand',
type_season.name AS 'name_season',name_season_year.name AS 'year_season',a.ship_date,
a.design_cover_id,ROUND(qty_order*unit_price,2) AS 'value_od_ttl',type_cbd_category.id,

(CASE
	WHEN type_cbd_category.type_material_id > 0 AND type_cbd_category.type_direct_id = 0 AND type_cbd_category.type_indirect_id = 0 THEN type_material.remark
    WHEN type_cbd_category.type_material_id = 0 AND type_cbd_category.type_direct_id > 0 AND type_cbd_category.type_indirect_id = 0 THEN type_directcost.remark
    WHEN type_cbd_category.type_material_id = 0 AND type_cbd_category.type_direct_id = 0 AND type_cbd_category.type_indirect_id > 0 AND type_cbd_category.id <> 25 THEN type_indirectcost.remark
END) AS 'name_category',doc_cbd_summary.value_total AS 'value_each_category',b.val_total AS 'value_grand_total',c.value_order_ttl AS 'value_order_ttl',
ROUND(ROUND(qty_order*unit_price,2)*(doc_cbd_summary.value_total/b.val_total),2) AS 'est_amount',

(CASE
	WHEN type_cbd_category.id = 1 THEN DATE_ADD(a.ship_date, INTERVAL -60 DAY)
    WHEN type_cbd_category.id = 2 THEN DATE_ADD(a.ship_date, INTERVAL -60 DAY)
    WHEN type_cbd_category.id = 9 THEN DATE_ADD(a.ship_date, INTERVAL 30 DAY)
    ELSE a.ship_date
END) AS 'est_plan_date'

FROM doc_fg_po a
LEFT OUTER JOIN doc_design_cover ON a.design_cover_id = doc_design_cover.id
LEFT OUTER JOIN name_company ON doc_design_cover.vendor_comp_id = name_company.id
LEFT OUTER JOIN type_team ON doc_design_cover.type_team_id = type_team.id
LEFT OUTER JOIN name_company name_company2 ON doc_design_cover.brand_company_id = name_company2.id
LEFT OUTER JOIN type_season ON doc_design_cover.type_season_id = type_season.id
LEFT OUTER JOIN name_season_year ON doc_design_cover.name_season_y_id = name_season_year.id
LEFT OUTER JOIN doc_cbd_summary ON a.design_cover_id = doc_cbd_summary.doc_design_cover_id
LEFT OUTER JOIN type_cbd_category ON doc_cbd_summary.type_cbd_category_id = type_cbd_category.id
LEFT OUTER JOIN type_material ON type_cbd_category.type_material_id = type_material.id
LEFT OUTER JOIN type_directcost ON type_cbd_category.type_direct_id = type_directcost.id
LEFT OUTER JOIN type_indirectcost ON type_cbd_category.type_indirect_id = type_indirectcost.id

LEFT OUTER JOIN (SELECT doc_design_cover_id,ROUND(SUM(value_total),2) AS 'val_total' FROM doc_cbd_summary GROUP BY doc_design_cover_id) b
ON doc_cbd_summary.doc_design_cover_id = b.doc_design_cover_id

LEFT OUTER JOIN (SELECT design_cover_id,ROUND(SUM(qty_order*unit_price),2) AS 'value_order_ttl' FROM doc_fg_po GROUP BY design_cover_id) c
ON doc_cbd_summary.doc_design_cover_id = c.design_cover_id

WHERE a.type_document_id = 1