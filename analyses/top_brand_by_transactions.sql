/* 
    Which brand has the most transactions among users who were created within the past 6 months?
*/

with rank_cte as (
    select
        brandName,
        barcode,
        receiptCount,
        dense_rank() over (order by receiptCount desc) as brandReceiptRank
    from brand_receipts_recent_users
)

select
    brandName,
    barcode,
    receiptCount,
    brandReceiptRank
from rank_cte
where brandReceiptRank = 1
;

/*
┌───────────┬─────────┬──────────────┬──────────────────┐
│ brandName │ barcode │ receiptCount │ brandReceiptRank │
│  varchar  │ varchar │    int64     │      int64       │
├───────────┼─────────┼──────────────┼──────────────────┤
│ NULL      │ 4011    │     113      │        1         │
└───────────┴─────────┴──────────────┴──────────────────┘
*/
