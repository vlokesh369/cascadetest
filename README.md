# cascadetest

I have chosen to use snowflake as my warehouse here. 

# Extracting the source data into individual csv files for seeding
I have tried using pandas to extract the sheets but had isssues with the lib installations. For time being, I have used a pyspark code to extract
individual sources details. I also did the columnar level mapping using the pyspark code. Below is the Pseudo code(can be made more dynamic way)
Step 1: Created struct schema of the columns provided.
Step 2: 
df=spark.read.format("com.crealytics.spark.excel").option("header""true").option ("dataAddress"''PACIFIC'!A1")
   load("/mnt/external/test/carmen_sightings_20220629061307.xlsx")
df.write.option("delimiter",",").csv("csv_path")
df1=spark.read.option("header",True).option("delimiter",",").schema(struct_schema).csv("path")\
    .coalesce(1).write.option("header",True).option("delimiter",",").csv("path")

#Loading individual csv to seeds
Loaded individual csv to seeds and ran DBT seed. This created tables for all the sources on snowflake warehouse. 
#creating views on top of the tables
Created views on top of all the sources by referencing the seeds.
#combining all the views into one staging view
Created a staging view by combining all the eight source views.
# Created persisting marts
Created agent,region,witness marts. For region, created a surrogate key using md5 hashing based on the coordinates.Used as a foreign key on region table.
# Created Analytical queries underneath requests.
REQUEST1:
REQUEST2:
REQUEST3
REQUEST4:

#Lineage graph

#dbt docs link
