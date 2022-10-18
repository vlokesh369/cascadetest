select 
date_witness,
witness,
behavior,
has_weapon,
has_hat,
has_jacket,
md5(country || city || latitude || longitude ) as location_id
from {{ ref('staging_vw') }}
