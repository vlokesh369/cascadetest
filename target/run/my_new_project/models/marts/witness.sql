

      create or replace transient table PC_DBT_DB.dbt_LVenkenddini.witness  as
      (select 
date_witness,
witness,
behavior,
has_weapon,
has_hat,
has_jacket,
md5(country || city || latitude || longitude ) as location_id,
md5(agent || city_agent || date_agent) as agent_key
from PC_DBT_DB.dbt_LVenkenddini.staging_vw
      );
    