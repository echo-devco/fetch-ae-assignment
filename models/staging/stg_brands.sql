create or replace view stg_brands as 

select
    _id['$oid'] as brandId,
    barcode, 
    brandCode, 
    category, 
    categoryCode, 
    cpg, 
    topBrand as isTopBrand, 
    name as brandName
from read_json('https://fetch-hiring.s3.amazonaws.com/analytics-engineer/ineeddata-data-modeling/brands.json.gz')
;
