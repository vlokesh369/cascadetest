select 
country,
city,
latitude,
longitude,
md5(country || city || latitude || longitude ) as location_id
from PC_DBT_DB.dbt_LVenkenddini.staging_vw