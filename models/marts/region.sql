select 
country,
city,
latitude,
longitude,
md5(country || city || latitude || longitude ) as location_id
from {{ ref('staging_vw') }}