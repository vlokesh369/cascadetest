# cascadetest

I have chosen to use snowflake as my warehouse here. 

# Extracting the source data into individual csv files for seeding
I have tried using pandas to extract the sheets but had isssues with the lib installations. For time being, I have used a pyspark code using databricks environment to extract
individual sources details. I also did the columnar level mapping using the pyspark code. Below is the Pseudo code(can be made more dynamic way)

# Step 1: 

Created struct schema of the columns provided.

# Step 2: 

df=spark.read.format("com.crealytics.spark.excel").option("header""true").option ("dataAddress"''PACIFIC'!A1")
   load("/mnt/external/test/carmen_sightings_20220629061307.xlsx")
df.write.option("delimiter",",").csv("csv_path")
df1=spark.read.option("header",True).option("delimiter",",").schema(struct_schema).csv("path")\
    .coalesce(1).write.option("header",True).option("delimiter",",").csv("path")

# Loading individual csv to seeds

Loaded individual csv to seeds and ran DBT seed. This created tables for all the sources on snowflake warehouse. 

# Creating views on top of the tables

Created views on top of all the sources by referencing the seeds.

# Combining all the views into one staging view

Created a staging view by combining all the eight source views.

# Created persisting marts

Created agent,region,witness marts. For region, created a surrogate key using md5 hashing based on the coordinates.Used as a foreign key on region table.

# Created Analytical queries underneath requests.

REQUEST1:

<img width="497" alt="image" src="https://user-images.githubusercontent.com/95598821/196474734-5b55f682-01f6-4587-881d-ead01d5d1add.png">


REQUEST2:


<img width="454" alt="image" src="https://user-images.githubusercontent.com/95598821/196474958-66bf53a5-c21d-4368-ab22-924a37e63302.png">

REQUEST3:


<img width="318" alt="image" src="https://user-images.githubusercontent.com/95598821/196475138-7b094366-f96b-4354-8af4-c88d34344598.png">

REQUEST4:


<img width="487" alt="image" src="https://user-images.githubusercontent.com/95598821/196475321-cfb4a5f8-8950-4a73-a260-0a57a5e42b7c.png">


# Lineage graph

<img width="912" alt="image" src="https://user-images.githubusercontent.com/95598821/196475665-15b58451-430c-4d1a-af2a-4cf6a853f1a8.png">


# dbt docs link

https://cloud.getdbt.com/accounts/114592/develop/1811976/docs/index.html#!/overview
