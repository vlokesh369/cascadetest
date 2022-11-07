with sighting_details as 
(
    select * from PC_DBT_DB.dbt_LVenkenddini.region
    inner join PC_DBT_DB.dbt_LVenkenddini.witness
    on region.location_id=witness.location_id
),
month_details as
(
    select TO_CHAR((date_witness),'MMMM')as month ,city from sighting_details
),
sighting as
(
    select month,city,count(*),RANK() OVER (PARTITION BY month order by count(*) desc) AS rank from month_details
    group by city,month
)

select month as Month_of_sighting,
city as city_frequently_sighted
from sighting
where sighting.rank = 1
order by sighting.month