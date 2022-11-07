with action 
as 
(
select behavior, count(*) as count from PC_DBT_DB.dbt_LVenkenddini.witness
group by behavior order by count desc
)

select behavior from action
limit 3