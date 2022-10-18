
SELECT
*
FROM {{ ref("AFRICA_VW") }}

{% for region in ["AMERICA_VW", "ATLANTIC_VW", "AUSTRALIA_VW", "ASIA_VW", "EUROPE_VW", "INDIAN_VW", "PACIFIC_VW"] %}

UNION

SELECT
*
FROM {{ ref(region) }} 

{% endfor %}