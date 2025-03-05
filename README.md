# fetch-ae-assignment

## Proposed Relational Model
receipts
- receiptId (PK)
- userId (FK)
- bonusPointsEarned 
- bonusPointsReason 
- createdDate 
- dateScanned 
- finisheDate 
- modifiedDate 
- pointsAwardedDate 
- pointsEarned 
- purchaseDate 
- itemCount 
- receiptStatus 
- totalSpent 

brands
- brandId (PK)
- barcode (FK)
- brandCode 
- category 
- categoryCode 
- cpg
- isTopBrand
- BrandName

users
- userId (PK)
- signUpState
- signUpSource
- createdDate
- lastLogin
- role
- isActive

int_receiptItems
- receiptItemId (PK)
- receiptId (FK)
- barcode (FK)
- userId (FK)
- brandCode 
- pointsPayerId
- partnerItemId
- rewardsProductPartnerId
- originalReceiptIemText 
- rewardsGroup 
- competitorRewardsGroup 
- itemNumber 
- pointsEarned 
- targetPrice
- description 
- quantityPurchased 
- finalPrice 
- originalFinalPrice 
- itemPrice 
- discountedItemPrice
- priceAfterCoupon 
- pointsNotAwardedReason 
- userFlaggeDescription 
- needsReview 
- preventTargetGapPoints  
- isCompetitiveProduct 
- metabriteCampaignId
- originalMetabriteBarcode 
- originalMetabriteDescription 
- originalMetabriteQuantityPurchased
- originalMetabriteItemPrice 
- userFlaggedBarcode 
- userFlaggedNewItem 
- userFlaggedPrice 
- userFlaggedQuantity 
- needsReviewReason 
- isDeleted

brand_receipts_recent_users
- barcode (FK)
- brandCode
- brandName
- brandCategory
- receiptCount
- userCount
- purchasedItemCount
- totalSpent
- pointsEarned   

Relationships:
Receipts 1:N ReceiptItems (receiptId)
Users 1:N Receipts (userId)
Brands 1:N ReceiptItems (barcode)
ReceiptItems N:1 Users (userId)
brand_receipts_recent_users N:1 Brands (barcode)

## Business Questions
brand_receipts_recent_users answers the following questions:
1) Which brand has the most transactions among users who were created within the past 6 months?
    - answered by analyses/top_brand_by_transactions.sql
2) Which brand has the most spend among users who were created within the past 6 months?
    - answered by analyses/top_brand_by_spend.sql

## Data Quality

## Stakeholder Communication
