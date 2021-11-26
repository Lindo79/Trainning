USE daehan_db;

SELECT id FROM name_fg_market WHERE name = 'China';
SELECT * FROM name_fg_size WHERE name = 'XS';
SELECT id FROM name_company WHERE name = 'Walmart';
SELECT id FROM group_entity_buyer WHERE brand_company_id = (SELECT id FROM name_company WHERE name = 'Walmart');

SELECT * FROM doc_fg_po;
SELECT * FROM type_shipmode ORDER BY id ASC;
SELECT * FROM name_country WHERE name LIKE '%unit%';
SELECT name FROM name_fg_size ORDER BY name ASC;
SELECT * FROM name_fg_market;

SELECT * FROM group_entity_buyer WHERE brand_company_id = '97';
SELECT * FROM name_company WHERE name LIKE '%net&%';
SELECT * FROM doc_design_cover WHERE no_indent LIKE 'LEDA%';
SELECT * FROM doc_design_cover WHERE brand_company_id = '98';
SELECT * FROM name_company WHERE type_entity_id = 1;

SELECT * FROM name_company;
SELECT * FROM name_country ORDER BY name ASC;

SELECT name FROM type_season ORDER BY name ASC;
SELECT name FROM name_season_year ORDER BY name ASC;
SELECT name FROM type_gender ORDER BY name ASC;
SELECT name FROM type_fabric_main ORDER BY name ASC;
SELECT name FROM type_apparel ORDER BY name ASC;
SELECT * FROM type_order;
SELECT * FROM name_company WHERE id = '23';
SELECT * FROM type_dept WHERE id = '3';
SELECT * FROM type_team WHERE id = '27';
SELECT name FROM name_company WHERE type_entity_id ='1' ORDER BY name ASC;
SELECT name_eng FROM type_dept WHERE name_eng = 'Sales';
SELECT name FROM type_team ORDER BY name ASC;

SELECT * FROM doc_design_cover WHERE id ='133';

SELECT doc_fg_po.id,doc_fg_po.no_style,doc_fg_po.no_po,type_shipmode.name,name_country.name,name_fg_market.name,name_fg_color.name,name_fg_size.name,
doc_fg_po.ship_date,doc_fg_po.qty_order,doc_fg_po.unit_price,doc_fg_po.remark,doc_fg_po.status
FROM doc_fg_po
INNER JOIN type_shipmode ON doc_fg_po.type_shipmode_id = type_shipmode.id
INNER JOIN name_country ON doc_fg_po.dest_country_id = name_country.id
INNER JOIN name_fg_market ON doc_fg_po.name_fg_market_id = name_fg_market.id
INNER JOIN name_fg_color ON doc_fg_po.name_fg_color_id = name_fg_color.id
INNER JOIN name_fg_size ON doc_fg_po.name_fg_size_id = name_fg_size.id
WHERE doc_fg_po.design_cover_id = '535' AND (doc_fg_po.no_style LIKE "%0%" OR doc_fg_po.no_po LIKE "%0%");

SELECT * FROM doc_design_cover;
SELECT * FROM name_company;
SELECT * FROM type_dept;
SELECT * FROM type_team;


SELECT name_company.name
FROM doc_design_cover
INNER JOIN name_company ON doc_design_cover.vendor_comp_id = name_company.id
WHERE doc_design_cover.id = '1';

SELECT type_dept.name_eng
FROM doc_design_cover
INNER JOIN type_dept ON doc_design_cover.type_dept_id = type_dept.id
WHERE doc_design_cover.id = '1';

SELECT type_team.name
FROM doc_design_cover
INNER JOIN type_team ON doc_design_cover.type_dept_id = type_team.id
WHERE doc_design_cover.id = '2';

SELECT * FROM type_document;
SELECT * FROM doc_design_cover WHERE no_indent='DHGI-2161T';

SELECT * FROM type_shipmode;
SELECT * FROM group_entity_buyer WHERE vendor_company_id = '23';

SELECT * FROM doc_fg_po_name;
UPDATE doc_fg_po_name SET co_mid = 'Buyer PO' WHERE type_document = '2';

SELECT * FROM name_company WHERE type_entity_id = '1';


SELECT DISTINCT PO_no FROM doc_fg_po_name WHERE name_brand = ('Hollister' or 'A&F' or 'Abercrombie & Fitch');

SELECT * FROM doc_fg_po;
SELECT * FROM doc_fg_po WHERE no_style = '133S0165';
SELECT DISTINCT design_cover_id FROM doc_fg_po WHERE no_style = '133S0165' AND status = 'Activate';

SELECT id FROM doc_design_cover WHERE no_indent='DHGI-9323T';

SELECT * FROM doc_design_cover;
SELECT brand_company_id FROM doc_design_cover WHERE id = '256';
SELECT vendor_comp_id FROM doc_design_cover WHERE id = '256';
SELECT no_design FROM doc_design_cover WHERE id = '256';

SELECT * FROM type_season;

SELECT type_dept.name_eng FROM doc_design_cover LEFT OUTER JOIN type_dept ON doc_design_cover.type_dept_id = type_dept.id WHERE doc_design_cover.id = '256';

SELECT * FROM group_entity_buyer;

SELECT id FROM group_entity_buyer
WHERE brand_company_id = (SELECT brand_company_id FROM doc_design_cover WHERE id = '256') AND
vendor_company_id = (SELECT vendor_comp_id FROM doc_design_cover WHERE id = '256');

SELECT * FROM doc_fg_po WHERE no_style = '133S0165';
SELECT * FROM doc_design_cover WHERE id = '419';

SELECT * FROM doc_design_cover WHERE no_indent LIKE '%DHGK%';

SELECT * FROM doc_fg_po;
SELECT qty_order FROM doc_fg_po;
SELECT unit_price FROM doc_fg_po;

SELECT qty_order * unit_price AS amount FROM doc_fg_po;

SELECT * FROM name_company;

SELECT * FROM doc_design_cover;

SELECT DISTINCT name_company.name
FROM doc_design_cover
LEFT OUTER JOIN name_company ON doc_design_cover.brand_company_id = name_company.id;

SELECT name FROM type_document ORDER BY id ASC;

SELECT * FROM doc_fg_po_name;

SELECT name_comp,name_dept,name_team,name_brand,date_ship,qty_order,qty_order * price_unit AS amount,
name_season,name_season_year,name_gender,type_fabric,type_garment,type_order,name_mid
FROM doc_fg_po_name
WHERE date_ship >= '2021-06-01' AND date_ship <= '2022-12-31' AND type_document = 'Buyer PO';

