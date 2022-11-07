SELECT 
    SOURCE_COUNTRY,
    agent,
    date_agent,
    city_agent,
    DATE_WITNESS,
    md5(agent || city_agent || date_agent) as agent_key
FROM PC_DBT_DB.dbt_LVenkenddini.staging_vw