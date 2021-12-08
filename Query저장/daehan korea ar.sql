SELECT name_company.name AS 'name_vendor',name_company2.name AS 'name_brand',num_invoice,
IF(doc_design_cover.no_indent IS NULL,'',doc_design_cover.no_indent) AS 'num_Indent',
num_style,num_po,type_shipmode.name,date_etd AS 'ETD',IF(date_atd='0000-00-00','',date_atd) AS 'ATD',
IF(date_payment_submit='0000-00-00','',date_payment_submit) AS 'PSD',
IF(date_payment_due='0000-00-00','',date_payment_due) AS 'PDD',
IF(date_received='0000-00-00','',date_received) AS 'PRD',
amount_final AS '선적금액',IF(date_received IS NULL,'',amount_final) AS '입금액',
amount_final-IF(date_received = '0000-00-00','',amount_final) AS '미입금액',qty_shipped,amount_shipped,amount_final

FROM doc_ar
LEFT OUTER JOIN name_company ON doc_ar.name_vendor_id = name_company.id
LEFT OUTER JOIN name_company name_company2 ON doc_ar.name_brand_id = name_company2.id
LEFT OUTER JOIN type_shipmode ON doc_ar.type_shipmode_id = type_shipmode.id
LEFT OUTER JOIN doc_design_cover ON doc_ar.doc_design_cover_id = doc_design_cover.id
WHERE name_vendor_id = '23';