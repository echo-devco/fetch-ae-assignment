create or replace view stg_receipts as 

select
    _id['$oid'] as receiptId,
    bonusPointsEarned,
    bonusPointsEarnedReason,
    to_timestamp(createDate['$date']/ 1000) as createDate,
    to_timestamp(dateScanned['$date']/ 1000) as dateScanned,
    to_timestamp(finishedDate['$date']/ 1000) as finishedDate,
    to_timestamp(modifyDate['$date']/ 1000) as modifyDate,
    to_timestamp(pointsAwardedDate['$date']/ 1000) as pointsAwardedDate,
    pointsEarned::numeric as pointsEarned,
    to_timestamp(purchaseDate['$date']/ 1000) as purchaseDate,
    purchasedItemCount,
    rewardsReceiptItemList, 
    rewardsReceiptStatus,
    totalSpent::numeric(16,2) as totalSpent,
    userId as userId
from read_json('https://fetch-hiring.s3.amazonaws.com/analytics-engineer/ineeddata-data-modeling/receipts.json.gz')
;