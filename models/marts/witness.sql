select 
date_witness,
witness,
behavior,
has_weapon,
has_hat,
has_jacket,
md5(country || city || latitude || longitude ) as location_id,
md5(agent || city_agent || date_agent) as agent_key
from {{ ref('staging_vw') }}
