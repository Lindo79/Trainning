USE daehan_db;

SELECT id FROM name_fg_market WHERE name = 'China';
SELECT * FROM name_fg_size WHERE name = 'XS';
SELECT id FROM name_company WHERE name = 'Walmart';
SELECT id FROM group_entity_buyer WHERE brand_company_id = (SELECT id FROM name_company WHERE name = 'Walmart');

SELECT * FROM doc_fg_po;
SELECT * FROM type_shipmode ORDER BY id ASC;
SELECT name FROM name_country ORDER BY name ASC;
SELECT name FROM name_fg_size ORDER BY name ASC;

SELECT doc_fg_po.id,doc_fg_po.no_style,doc_fg_po.no_po,type_shipmode.name,name_country.name,name_fg_market.name,name_fg_color.name,name_fg_size.name,
doc_fg_po.ship_date,doc_fg_po.qty_order,doc_fg_po.unit_price,doc_fg_po.remark,doc_fg_po.status
FROM doc_fg_po
INNER JOIN type_shipmode ON doc_fg_po.type_shipmode_id = type_shipmode.id
INNER JOIN name_country ON doc_fg_po.dest_country_id = name_country.id
INNER JOIN name_fg_market ON doc_fg_po.name_fg_market_id = name_fg_market.id
INNER JOIN name_fg_color ON doc_fg_po.name_fg_color_id = name_fg_color.id
INNER JOIN name_fg_size ON doc_fg_po.name_fg_size_id = name_fg_size.id
WHERE doc_fg_po.design_cover_id = '535' AND (doc_fg_po.no_style LIKE "%0%" OR doc_fg_po.no_po LIKE "%0%");

SELECT * FROM group_entity_buyer WHERE brand_company_id = 99;
SELECT * FROM name_company WHERE name LIKE '%ama%';
SELECT * FROM doc_design_cover WHERE no_indent LIKE 'LEDA%';


