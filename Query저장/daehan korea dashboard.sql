SELECT name_company.name AS 'name_vendor',name_company2.name AS 'name_brand',num_invoice,
IF(doc_design_cover.no_indent IS NULL,'',doc_design_cover.no_indent) AS 'num_Indent',
num_style,num_po,qty_shipped,amount_shipped,amount_final,type_shipmode.name,

CASE
	WHEN x=1 THEN 'A) 선적액'
	WHEN x=2 THEN 'B) 입금액'
	WHEN x=3 THEN 'C) 입금만기액'
END 'date_description',

CASE
	WHEN x=1 THEN date_etd		
	WHEN x=2 THEN IF(date_received='0000-00-00','',date_received)
    WHEN x=3 THEN IF(date_received='0000-00-00','',date_payment_due)
END 'date_value'

FROM (
SELECT * FROM doc_ar a,
(SELECT 1 AS x
UNION ALL SELECT 2 AS x
UNION ALL SELECT 3 AS x) b
) a

LEFT OUTER JOIN name_company ON name_vendor_id = name_company.id
LEFT OUTER JOIN name_company name_company2 ON name_brand_id = name_company2.id
LEFT OUTER JOIN doc_design_cover ON doc_design_cover_id = doc_design_cover.id
LEFT OUTER JOIN type_shipmode ON type_shipmode_id = type_shipmode.id

WHERE name_vendor_id = '23';