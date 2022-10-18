with action 
as 
(
select behavior, count(*) as count from {{ ref('witness') }}
group by behavior order by count desc
)

select behavior from action
limit 3