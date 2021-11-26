USE daehan_db;

SELECT * FROM doc_fg_po_name WHERE date_ship > '2021-10-31' AND date_ship < '2022-04-01';
SELECT SUM(qty_order * price_unit) AS amount FROM doc_fg_po_name WHERE date_ship > '2021-10-31' AND date_ship < '2022-04-01' AND type_document = 'Buyer PO';

SELECT type_order.name FROM doc_design_cover LEFT OUTER JOIN type_order ON doc_design_cover.type_order_id = type_order.id WHERE no_indent = 'LEV-1044';
SELECT type_order_detail.name FROM doc_design_cover LEFT OUTER JOIN type_order_detail ON doc_design_cover.type_order_id = type_order_detail.id WHERE no_indent = 'LEV-1044';

SELECT * FROM doc_ap;

SELECT doc_ap.id,doc_ap.status,doc_ap.type_comp,doc_design_cover.no_indent,doc_ap.name_brand,doc_ap.num_design,doc_ap.name_season,
doc_ap.name_season_year,doc_ap.type_order,doc_ap.order_option,doc_ap.name_comp,doc_ap.desc_item,doc_ap.name_currency,doc_ap.qty_order,doc_ap.price_order,
doc_ap.qty_order*doc_ap.price_order,doc_ap.est_payment_date,doc_ap.qty_order_actual,doc_ap.price_order_actual,
doc_ap.qty_order_actual*doc_ap.price_order_actual,doc_ap.payroll_issued_date,doc_ap.paid_date,doc_ap.val_currency,type_taxation.name,
doc_ap.num_lc,doc_ap.name_bank,type_payment.name,doc_ap.num_PO,doc_ap.num_pi,doc_ap.num_ci,doc_ap.num_bl,doc_ap.remark,doc_ap.remark2
FROM doc_ap
LEFT OUTER JOIN doc_design_cover on doc_ap.no_indent_id = doc_design_cover.id
LEFT OUTER JOIN type_taxation on doc_ap.type_taxation_id = type_taxation.id
LEFT OUTER JOIN type_payment on doc_ap.type_payment_id = type_payment.id;

SELECT * FROM doc_design_cover WHERE no_indent = 'DHGI-2004T';
SELECT * FROM doc_design_cover;

SELECT doc_design_cover.id,name_company.name AS 'Vendor name',type_dept.name_kor AS 'Dept name',type_team.name AS 'Team name',doc_design_cover.status AS 'status',
doc_design_cover.no_indent AS 'Indent no',name_company2.name AS 'Brand name',doc_design_cover.no_design AS 'Design no',type_season.name AS 'Season name',
name_season_year.name AS 'Season Year',type_gender.name AS 'Gender',type_fabric_main.name AS 'Main Fabric',
type_apparel.name AS 'Garment name',type_order.name AS 'Order Type',type_order_detail.name AS 'Order Option',
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






