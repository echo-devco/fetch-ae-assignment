create or replace view stg_users as 

select
    _id['$oid'] as userId,
    state as signUpState,
    signUpSource,
    to_timestamp(createdDate['$date']/ 1000) as createdDate,
    to_timestamp(lastLogin['$date']/ 1000) as lastLogin,
    role,
    active as isActive
from read_json('seeds/users.json')
;
