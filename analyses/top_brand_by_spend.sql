/* 
    Which brand has the most spend among users who were created within the past 6 months?
*/

with rank_cte as (
    select
        brandName,
        barcode,
        totalSpent,
        dense_rank() over (order by totalSpent desc) as brandSpendRank
    from brand_receipts_recent_users
    where barcode is not null
)

select
    brandName,
    barcode,
    totalSpent,
    brandSpendRank
from rank_cte
where brandSpendRank = 1
;

/*
┌───────────┬──────────────┬───────────────┬────────────────┐
│ brandName │   barcode    │  totalSpent   │ brandSpendRank │
│  varchar  │   varchar    │ decimal(38,2) │     int64      │
├───────────┼──────────────┼───────────────┼────────────────┤
│ NULL      │ 036000320893 │    1931.92    │       1        │
└───────────┴──────────────┴───────────────┴────────────────┘
*/
