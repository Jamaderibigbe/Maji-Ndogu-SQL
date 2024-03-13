USE md_water_services;

/* 1. Get to know our data:
Start by retrieving the first few records from each table. How many tables are there in our database?
What are the names of these tables? Once you've identified the tables, write a SELECT statement to retrieve 
the first five records from each table. As you look at the data, take note of the columns and their 
respective data types in each table. What information does each table contain?*/

/* When accessing a new database in MySQL, a useful initial query to execute is "SHOW TABLES." 
  This query provides a comprehensive list of all the tables within the database.*/

SHOW TABLES;

/* It looks like someone took the time to name all of these tables pretty well because we can kind of figure out what each table is about
without really having to think too hard. water_source probably logs information about each source like where it is, what type of source
it is and so on*/

-- a SELECT statement to retrieve the first five records from Location Table.
SELECT *
FROM location
LIMIT 5;

/* So we can see that this table has information on a specific location, with an address, the province and town the location is in, and if it's
in a city (Urban) or not. We can't really see what location this is but we can see some sort of identifying number of that location.*/

-- a SELECT statement to retrieve the first five records from visit Table.
SELECT *
FROM visits
LIMIT 5;

/* so this is a list of location_id, source_id, record_id, and a date and time, 
so it makes sense that someone (assigned_employee_id) visited some location (location_id) at some time (time_of_record ) and found a 'source' there (source_id). 
Often the "_id" columns are related to another table. In this case, the source_id in the visits table refers to source_id in the water_source
table. This is what we call a foreign key.*/

-- a SELECT statement to retrieve the first five records from water_source Table.

SELECT *
FROM water_source
LIMIT 5;

/* Water sources are vital for providing people with their water supply. Considering the complexity of this database, it's wise to quickly review the other tables.*/

-- a SELECT statement to retrieve the first five records from employee Table.
SELECT *
FROM employee
LIMIT 5;

-- a SELECT statement to retrieve the first five records from global_water_access Table.
SELECT *
FROM global_water_access
LIMIT 5;

-- a SELECT statement to retrieve the first five records from water_quality Table.
SELECT *
FROM water_quality
LIMIT 5;

-- a SELECT statement to retrieve the first five records from well_polution Table.
SELECT *
FROM well_pollution
LIMIT 5;

-- a SELECT statement to retrieve the first five records from data_dictionary Table.

SELECT *
FROM data_dictionary;

/* A data dictionary has been embedded into the database. If you query the data_dictionary table, an explanation of each column is
given there.*/

/*2. Dive into the water sources:
Now that you're familiar with the structure of the tables, let's dive deeper. We need to understand the types of water sources we're
dealing with.*/

SELECT DISTINCT type_of_water_source
FROM water_source;
-- we see the different type of water sources at Maji Ndogu

/* 3. Unpack the visits to water sources:
We have a table in our database that logs the visits made to different water sources.*/

SELECT *
FROM visits
WHERE time_in_queue > 500;

/* The above SQL query reveals that some individuals in Maji Ndogu endure queues lasting more than 500 minutes for water.
 Reflecting on this, one can only imagine the hardship of waiting eight hours just to access a basic necessity like water. 
 It's a stark reminder of the challenges faced by communities grappling with water scarcity and the urgent need for sustainable solutions.*/


-- How is this possible? Can you imagine queueing 8 hours for water?

SELECT *
FROM water_source
WHERE source_id IN ('AkKi00881224', 'SoRu37635224', 'SoRu36096224');

/* 4. Assess the quality of water sources:
The quality of our water sources is the whole point of this survey. We have a table that contains a quality score for each visit made
about a water source that was assigned by a Field surveyor. They assigned a score to each source from 1, being terrible, to 10 for a
good, clean water source in a home. Shared taps are not rated as high, and the score also depends on how long the queue times are*/

SELECT *
FROM water_quality
WHERE subjective_quality_score = 10 
AND visit_count = 2;

/* I get 218 rows of data. But this should not be happening! I think some of our employees may have made mistakes. To be honest, I'll
be surprised if there are no errors in our data at this scale*/

/* 5. Investigate pollution issues:
Did you notice that we recorded contamination/pollution data for all of the well sources? Find the right table and print the first few rows.*/

SELECT *
FROM well_polLution
LIMIT 5;
/* It looks like our scientists diligently recorded the water quality of all the wells. Some are contaminated with biological contaminants,
while others are polluted with an excess of heavy metals and other pollutants. Based on the results, each well was classified as Clean,
Contaminated: Biological or Contaminated: Chemical. It is important to know this because wells that are polluted with bio- or
other contaminants are not safe to drink. It looks like they recorded the source_id of each test, so we can link it to a source, at some
place in Maji Ndogo.8/

/* In the well pollution table, the descriptions are notes taken by our scientists as text, so it will be challenging to process it. The
biological column is in units of CFU/mL, so it measures how much contamination is in the water. 0 is clean, and anything more than
0.01 is contaminated.
Let's check the integrity of the data. The worst case is if we have contamination, but we think we don't. People can get sick, so we
need to make sure there are no errors here.*/

-- So, write a query that checks if the results is Clean but the biological column is > 0.01.
SELECT *
FROM well_pollution 
WHERE results = 'Clean'
AND biological > 0.01;

/* If we compare the results of this query to the entire table it seems like we have some inconsistencies in how the well statuses are
recorded. Specifically, it seems that some data input personnel might have mistaken the description field for determining the cleanliness of the water.*/

/* It seems like, in some cases, if the description field begins with the word “Clean”, the results have been classified as “Clean” in the results column, even though the biological column is > 0.01.*/

-- search for the word Clean with additional characters after it. As this is what separates incorrect descriptions from the records that should have "Clean".

SELECT *
FROM well_pollution 
WHERE description LIKE 'Clean%_';

-- The query should return 38 wrong descriptions.
-- Now we need to fix these descriptions so that we don’t encounter this issue again in the future.

/* Looking at the results we can see two different descriptions that we need to fix:
1. All records that mistakenly have Clean Bacteria: E. coli should updated to Bacteria: E. coli
2. All records that mistakenly have Clean Bacteria: Giardia Lamblia should updated to Bacteria: Giardia Lamblia*/

/* The second issue we need to fix is in our results column. 
We need to update the results column from Clean to Contaminated: Biological where the biological column has a value greater than 0.01.*/

/* when we change any data on the database, we need to be SURE there are no errors, as this could fill the database with incorrect
values. A safer way to do the UPDATE is by testing the changes on a copy of the table first.*/

CREATE TABLE well_pollution_copy 
    AS ( 
	SELECT *
	FROM well_pollution
    );
   
/* We will get a copy of well_pollution called well_pollution_copy. Now we can make the changes, and if we discover there is a
mistake in our code, we can just delete this table, and run it again.*/

UPDATE well_pollution_copy
SET description = 'Bacteria: E. coli'
WHERE description = 'Clean Bacteria: E. coli';

UPDATE well_pollution_copy
SET description = 'Bacteria: Giardia Lamblia'
WHERE description = 'Clean Bacteria: Giardia Lamblia';

UPDATE well_pollution_copy
SET results = 'Contaminated: Biological'
WHERE biological > 0.01 AND results = 'Clean';

-- Put a test query here to make sure we fixed the errors.
-- Use the query we used to show all of the erroneous rows
SELECT *
FROM well_pollution_copy
WHERE description LIKE "Clean_%"
OR (results = "Clean" AND biological > 0.01);

-- we can change the table back to the well_pollution and delete the well_pollution_copy table.

UPDATE well_pollution
SET description = 'Bacteria: E. coli'
WHERE description = 'Clean Bacteria: E. coli';

UPDATE well_pollution
SET description = 'Bacteria: Giardia Lamblia'
WHERE description = 'Clean Bacteria: Giardia Lamblia';

UPDATE well_pollution
SET results = 'Contaminated: Biological'
WHERE biological > 0.01 AND results = 'Clean';

-- WE can delete the well_pollution_copy table
DROP TABLE  well_pollution_copy;