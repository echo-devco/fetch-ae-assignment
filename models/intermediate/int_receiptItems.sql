create or replace view int_receiptItems as 

select
    receiptId,
    userId,
    unnest(rewardsReceiptItemList, recursive := true)
from stg_receipts
;
