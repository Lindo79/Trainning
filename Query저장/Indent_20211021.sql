USE daehan_db;

SELECT * FROM doc_design_cover;

SELECT * FROM name_company;
SELECT id FROM type_season WHERE name = 'FA';
SELECT id FROM name_season_year WHERE name = '2021';
SELECT id FROM type_gender WHERE name = 'Boys';
SELECT id FROM type_fabric_main WHERE name = 'Knit';
SELECT id FROM type_apparel WHERE name = 'Bottom';
SELECT id FROM type_order WHERE name = 'Bulk';
SELECT id FROM type_order_detail WHERE name = ' ';
SELECT id FROM name_company WHERE name = 'Bac Giang Lgg Garment Corporation';

SELECT * FROM type_season;
SELECT COUNT(*) FROM name_season_year WHERE name = "2022";
SELECT * FROM name_season_year;

SELECT * FROM doc_design_cover;
SELECT * FROM doc_design_cover WHERE type_team_id = 29;

SELECT doc_design_cover.id,
CASE WHEN status = 'OPEN' THEN '1' ELSE '2' END AS status
FROM doc_design_cover;

UPDATE doc_design_cover SET type_team_id = '30' WHERE type_team_id is null;
SELECT * FROM name_company WHERE name LIKE "%Lee%";

SELECT doc_design_cover.id,doc_design_cover.no_indent,name_company.name,doc_design_cover.no_design,
type_season.name,name_season_year.Name,type_gender.name,type_fabric_main.name,type_apparel.name,type_order.name,type_order_detail.name,name_company2.name
FROM doc_design_cover
INNER JOIN name_company ON doc_design_cover.brand_company_id = name_company.id
INNER JOIN type_season ON doc_design_cover.type_season_id = type_season.id
INNER JOIN name_season_year ON doc_design_cover.name_season_y_id = name_season_year.id
INNER JOIN type_gender ON doc_design_cover.type_gender_id = type_gender.id
INNER JOIN type_fabric_main ON doc_design_cover.type_fabric_main_id = type_fabric_main.id
INNER JOIN type_apparel ON doc_design_cover.type_apparel_id = type_apparel.id
INNER JOIN type_order ON doc_design_cover.type_order_id = type_order.id
LEFT OUTER JOIN type_order_detail ON doc_design_cover.type_order_detail_id = type_order_detail.id
INNER JOIN name_company name_company2 ON doc_design_cover.mid_comp_id = name_company2.id
WHERE vendor_comp_id = '24' AND type_dept_id = '3' AND type_team_id IS NULL
ORDER BY no_indent ASC;



SELECT doc_design_cover.id,doc_design_cover.no_indent,name_company.name,doc_design_cover.no_design,
type_season.name,name_season_year.Name,type_gender.name,type_fabric_main.name,type_apparel.name,type_order.name,type_order_detail.name,name_company2.name
FROM doc_design_cover
INNER JOIN name_company ON doc_design_cover.brand_company_id = name_company.id
INNER JOIN type_season ON doc_design_cover.type_season_id = type_season.id
INNER JOIN name_season_year ON doc_design_cover.name_season_y_id = name_season_year.id
INNER JOIN type_gender ON doc_design_cover.type_gender_id = type_gender.id
INNER JOIN type_fabric_main ON doc_design_cover.type_fabric_main_id = type_fabric_main.id
INNER JOIN type_apparel ON doc_design_cover.type_apparel_id = type_apparel.id
INNER JOIN type_order ON doc_design_cover.type_order_id = type_order.id
INNER JOIN type_order_detail ON doc_design_cover.type_order_detail_id = type_order_detail.id
INNER JOIN name_company name_company2 ON doc_design_cover.mid_comp_id = name_company2.id
WHERE vendor_comp_id = '23' AND type_dept_id = '3' AND type_team_id = '29'
ORDER BY doc_design_cover.no_indent ASC;

SELECT doc_design_cover.id,doc_design_cover.no_indent,name_company.name,doc_design_cover.no_design,
type_season.name,name_season_year.Name,type_gender.name,type_fabric_main.name,type_apparel.name,type_order.name,type_order_detail.name,name_company2.name
FROM doc_design_cover
INNER JOIN name_company ON doc_design_cover.brand_company_id = name_company.id
INNER JOIN type_season ON doc_design_cover.type_season_id = type_season.id
INNER JOIN name_season_year ON doc_design_cover.name_season_y_id = name_season_year.id
INNER JOIN type_gender ON doc_design_cover.type_gender_id = type_gender.id
INNER JOIN type_fabric_main ON doc_design_cover.type_fabric_main_id = type_fabric_main.id
INNER JOIN type_apparel ON doc_design_cover.type_apparel_id = type_apparel.id
INNER JOIN type_order ON doc_design_cover.type_order_id = type_order.id
INNER JOIN type_order_detail ON doc_design_cover.type_order_detail_id = type_order_detail.id
INNER JOIN name_company name_company2 ON doc_design_cover.mid_comp_id = name_company2.id
WHERE doc_design_cover.no_indent LIKE '%ropostale, Inc.%' OR name_company.name LIKE '%ropostale, Inc.%'
OR doc_design_cover.no_design LIKE '%ropostale, Inc.%' OR type_season.name LIKE '%ropostale, Inc.%'
OR name_season_year.Name LIKE '%ropostale, Inc.%' OR type_gender.name LIKE '%ropostale, Inc.%' OR type_fabric_main.name LIKE '%ropostale, Inc.%'
OR type_apparel.name LIKE '%ropostale, Inc.%' OR type_order.name LIKE '%ropostale, Inc.%' OR type_order_detail.name LIKE '%ropostale, Inc.%'
OR name_company2.name LIKE '%ropostale, Inc.%';



