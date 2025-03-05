create or replace view int_users as 

select * from stg_users
qualify row_number() over (partition by userId order by createdDate desc) = 1
;