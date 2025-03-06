# fetch-ae-assignment

## Proposed Relational Model

#### [receipts](models/staging/stg_receipts.sql)
\- receiptId (PK)  
\- userId (FK)  
\- bonusPointsEarned  
\- bonusPointsReason  
\- createdDate  
\- dateScanned  
\- finisheDate  
\- modifiedDate  
\- pointsAwardedDate  
\- pointsEarned  
\- purchaseDate  
\- itemCount  
\- receiptStatus  
\- totalSpent  

#### [brands](models/staging/stg_brands.sql)
\- brandId (PK)  
\- barcode (FK)  
\- brandCode  
\- category  
\- categoryCode  
\- cpg  
\- isTopBrand  
\- BrandName  

#### [users](models/staging/stg_users.sql)
\- userId (PK)  
\- signUpState  
\- signUpSource  
\- createdDate  
\- lastLogin  
\- role  
\- isActive  

#### [receiptItems](models/intermediate/int_receiptItems.sql)
\- receiptItemId (PK)  
\- receiptId (FK)  
\- barcode (FK)  
\- userId (FK)  
\- brandCode  
\- pointsPayerId  
\- partnerItemId  
\- rewardsProductPartnerId  
\- originalReceiptIemText  
\- rewardsGroup  
\- competitorRewardsGroup  
\- itemNumber  
\- pointsEarned  
\- targetPrice  
\- description  
\- quantityPurchased  
\- finalPrice  
\- originalFinalPrice  
\- itemPrice  
\- discountedItemPrice  
\- priceAfterCoupon  
\- pointsNotAwardedReason  
\- userFlaggeDescription  
\- needsReview  
\- preventTargetGapPoints  
\- isCompetitiveProduct  
\- metabriteCampaignId  
\- originalMetabriteBarcode  
\- originalMetabriteDescription  
\- originalMetabriteQuantityPurchased  
\- originalMetabriteItemPrice  
\- userFlaggedBarcode  
\- userFlaggedNewItem  
\- userFlaggedPrice  
\- userFlaggedQuantity  
\- needsReviewReason  
\- isDeleted  

#### [brand_receipts_recent_users](models/brand_receipts_recent_users.sql)
\- barcode (FK)  
\- brandCode  
\- brandName  
\- brandCategory  
\- receiptCount  
\- userCount  
\- purchasedItemCount  
\- totalSpent  
\- pointsEarned  

### Relationships
Receipts 1:N ReceiptItems (receiptId)  
Users 1:N Receipts (userId)  
Brands 1:N ReceiptItems (barcode)  
ReceiptItems N:1 Users (userId)  
brand_receipts_recent_users N:1 Brands (barcode) 

## Business Questions
brand_receipts_recent_users answers the following questions:
1) Which brand has the most transactions among users who were created within the past 6 months?
    - answered by [top_brand_by_transactions](analyses/top_brand_by_transactions.sql)
2) Which brand has the most spend among users who were created within the past 6 months?
    - answered by [top_brand_by_spend](analyses/top_brand_by_spend.sql)

## Data Quality
**Key Observations**  
- Approximately 14% (70) users appear to be duplicate entries.  
- Around 8% (552) of receipt transaction brand barcode values are missing in the brand data source.  
- The overall volume of user signups and receipt transactions are recored in 2021. 

[Data Quality Analysis Notebook](_data_quality.ipynb)

## Stakeholder Communication

I've been diving into the brand, user, and transaction data to understand their characteristics and quality attributes. Here's a summary of my initial observations and some questions that will help us move forward:

**Data Quality Observations and Questions**
- Approximately 14% (70) users appear to be duplicate entries. Do we know what may be the cause? Would it be appropriate to address this behavior in the future upstream?  
- Around 8% (552) of receipt transaction brand barcode values are missing in the brand data source. Do we know why this may be occurring?  
- The overall volume of user signups and receipt transactions are recored in 2021. Should receipt transactions and user signup dates prior to 2021 be considered? Should more recent activity be expected?  
- Were there any known incidents that interrupted the recording of receipt transactions or user signups?  
- What is the explanation for having more than one barcode value associated with a brandId value?  
- Is there any documentation available that explains the attributes within the `rewardsReceiptItemList`?  

**Optimization and Scaling Considerations**
- What are some of the common questions or characteristics the team is seeking to monitor on a regular frequency?  
- What types of data science models are planned or of high interest to develop?  
- How frequenty will the data be referenced to inform decisions?  
- At what rate do we expect the volume of transactions and user signups to increase in the future?  
- Are any new properties currently planned to be added or deactivated for the data sources?  

Thanks for your help towards addressing these data quality and development considerations!

Sean
