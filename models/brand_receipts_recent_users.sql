create or replace table brand_receipts_recent_users as 

select
    i.barcode,
    i.brandCode,
    b.brandName,
    b.category as brandCategory,
    count(distinct i.receiptId) as receiptCount,
    count(distinct u.userId) as userCount,
    sum(i.quantityPurchased) as purchasedItemCount,
    sum(i.itemPrice::numeric(12,2)) as totalSpent,
    sum(i.pointsEarned::numeric(12,0)) as pointsEarned
    
from int_receiptItems i
inner join stg_receipts r
    on i.receiptId = r.receiptId
inner join int_users u
    on i.userId = u.userId
left join stg_brands b
    on i.barcode  = b.barcode
where date_add(u.createdDate, interval 4 years) >= ((current_date-1) - (interval 6 month))
group by all
;
