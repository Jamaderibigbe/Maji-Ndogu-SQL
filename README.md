# Maji-Ndogu-SQL-
we embark on the vital task of extracting insights from our extensive data. we dive into the database, understand its structure, and explore the connections between variables. Each record holds a piece of our story, waiting to be discovered. Let's uncover patterns, ask critical questions, and pave the way for data-driven solutions.

#### Back story
Maji Ndogu the Vibant heart.

A nation where a mighty river flowed throuh the land, bringing Life to its children. This was once a beacon of hope. thriving communities were built around fertile land and abundance of clean water. the cities was bustling. Urban centers brimming with promise.
Today the picture is far different. A terrible drought made clean water a luxury. every day is a struggle as people queue for hours often in vain for their shear of life's most basic necessity. A legacy of mismanagement and corruption choked off Maji Ndogu Lifeblood,
leaving its water infrastructure in ruins. Greed blinded the government until there was nothing left.
But Dawn follows the darkst night, the communities rose up, their voices echoed throuhout Maji Ndogu and together they brought about the dawn. This Government is guided by the principles of transparency and deficiency. They embrace a future driven by data and truth,
their mission was clear, Restore the flow of water in Maji Ndogu. they wanted data to inform their decisions, but first they needed to see again. a sweeping water survey across provinces, towns, and countless water sources will map out Maji Ndogu thirst. 
that's where we come in.

They are assembling a diverse team, commited to innovation, driven by compasssion and fueled by science and technology. their team of Engineers, Data analyst, Surveyors, scienctists, designers, and project managers are all standing Ready. will you join us ?
help them understand the crisis, guide their decision with truth. help them restore the flow of water to Maji Ndogu and with it life.

##### The narrative we're about to delve into isn't unique to Maji Ndogo; it resonates with real-world challenges encountered in numerous locations worldwide. Our objective is to revitalize the diminishing Mto wa Matumaini – The River of Hope – through a data-driven methodology.

##### Large portions of this project were generated with the assistance of AI. While all characters and locales are fictional, they were intentionally crafted for this purpose.

### About Data
The dataset comprises of over 60,000 unique records.

### Data model
The database md_water_services includes more than 60 000 unique records and 43 columns. The data model, including the column names, data types and feature descriptions. [md_water_services](https://github.com/Jamaderibigbe/Maji-Ndogu-SQL/blob/main/md_water_services.sql)

#### employee table
| Column name               | Description                                     | Data Type      |
| :------------------------ | :---------------------------------------------- | :------------- |
| assigned_employee_id      | Unique ID assigned to each employee.            |  INT           |
| employee_name             | Name of the employee.                           | VARCHAR(255)   |
| phone_number              | Contact number of the employee.                 | VARCHAR(15)    |
| email                     | Email address of the employee.                  | VARCHAR(255)   |
| address                   | Residential address of the employee.            | VARCHAR(255)   |
| town_name                 | Name of the town where the employee resides.    | VARCHAR(255)   |
| province_name             | Name of the province where the employee resides.| VARCHAR(255)   |
| position                  | Position or job title of the employee.          | VARCHAR(255)   |

#### global_water_access table
| Column name               | Description                                                         | Data Type      |
| :------------------------ | :---------------------------------------------------------------------| :------------- |
| name                      | The country or area name.                                             | VARCHAR(255)   |
| region                    | Geographical region.                                                  | VARCHAR(255)   | 
| year                      | Year of the data record.                                              | INT            |
| pop_n                     | The national population size estimate in thousands.                   | FLOAT          |
| pop_u                     | The urban population share estimate in percentage points (%).         | FLOAT          |
| wat_bas_n                 | The estimated national share of people with atleast basic service (%).| FLOAT          |
| wat_lim_n                 | The estimated national share of people with limited service (%).      | FLOAT          |
| wat_unimp_n               | The estimated national share of people with unimproved service (%).   | FLOAT          |
| wat_sur_n                 | The estimated national share of people with surface service (%).      | FLOAT          |
| wat_bas_r                 | The estimated rural share of people with at least basic service (%).  | FLOAT          |
| wat_lim_r                 | The estimated rural share of people with limited service (%).         | FLOAT          |
| wat_unimp_r               | The estimated rural share of people with unimproved service (%).      | FLOAT          |
| wat_sur_r                 | The estimated rural share of people with surface service (%).         | FLOAT          |
| wat_bas_u                 | The estimated urban share of people with at least basic service (%).  | FLOAT          |
| wat_lim_u                 | The estimated urban share of people with limited service (%).         | FLOAT          |
| wat_unimp_u               | The estimated urban share of people with unimproved service (%).      | FLOAT          |
| wat_sur_u                 | The estimated urban share of people with surface service (%).         | FLOAT          |

#### location table
| Column name               | Description                                                | Data Type      |
| :----------------------   | :--------------------------------------------------------- | :------------- |
| location_id               | Unique ID assigned to each location.                       | VARCHAR(255)   |
| address                   |Address of the location.                                    | VARCHAR(255)   |
| province_name             | Name of the province where the location is situated.       | VARCHAR(255)   |
| town_name                 | Name of the town where the location is situated.           | VARCHAR(255)   |
| location_type             | Type or category of the location.                          | VARCHAR(255)   |

#### visits table
| Column name               | Description                                                             | Data Type      |
| :----------------------   | :---------------------------------------------------------------------- | :------------- |
| record_id                 | Unique ID assigned to each visit.                                       | INT            |
| location_id               | ID of the location visited.                                             | VARCHAR(255)   |
| source_id                 | ID of the water source visited.                                         | VARCHAR(510)   |
| time_of_record            | Date and time of the visit.                                             | DATETIME       |
| visit_count               | Number of visits made to this location.                                 | INT            |
| time_in_queue             | Time spent by people waiting for water in aqueue at the location.       | INT            |
| assigned_employee_id      | ID of the employee who visited the location.                            | INT            |

#### water_quality table
| Column name               | Description                                                             | Data Type      |
| :----------------------   | :---------------------------------------------------------------------- | :------------- |
| record_id Unique          | ID assigned to each record.                                             | INT            |
| subjective_quality_score  | Score representing the subjective quality of the water source.          | INT            |
| visit_count               | Number of visits made for data collection.                              | INT            |

#### water_source table
| Column name               | Description                                                             | Data Type      |
| :----------------------   | :---------------------------------------------------------------------- | :------------- |
| source_id                 | Unique ID assigned to each water source.                                | INT            |
| type_of_water_source      | Type or category of the water source. Can be:                           |                |
|                           |  tap_in_home, tap_in_home_broken, well,shared_tap, river.               | INT            |
| Number_of_people_served   | Number of people served by this water source.                           | INT            |

#### well_pollution table
| Column name               | Description                                             | Data Type      |
| :----------------------   | :------------------------------------------------------ | :------------- |
| source_id                 | ID of the water source being tested for pollution.      | VARCHAR(258)   |
| date                      | Date of the pollution test.                             | DATETIME       |
| description               | Description of the pollution test.                      | VARCHAR(255)   |
| pollutant_ppm             | Result of the pollution test in parts per million.      | FLOAT          |
| biological                | Biological contamination level.                         | FLOAT          |
| results                   | Result of the pollution test.                           | VARCHAR(255)   |


Now, we have to load this database and thoroughly acquaint ourselves with it. Let's dive deep, explore its structure, understand the variables, and the connections between them. Each record is a chapter of their story; every query we run is a thread weaving that story together. This is a process of discovery - to uncover the patterns and nuances in their data. It's our chance to ask the right questions, to identify the pressing problems, and to set the course for their data-driven solutions.

As we proceed, we have to remember that every bit of information is a piece of the bigger puzzle. Every insight, no matter how small, brings us one step closer to solving the water crisis. Together, we have embarked on this journey to bring about change. Let's continue to march ahead with the same determination and resolve.

#### This project will be structured into four parts. 
In the initial phase, we will delve into Maji Ndogo's comprehensive database, which comprises 60,000 records distributed across multiple tables. Our objective in this phase is to familiarize ourselves with the dataset's content through basic queries, enabling us to gain insights into each table's contents.

The initial part will facilitate our ability to address the following question

1. Get to know our data: Before we do anything else, let's take a good look at our data. We'll load up the database and pull up the first few records from each table. It's like getting to know a new city - we need to explore the lay of the land before we can start our journey.
2. Dive into the water sources: We've got a whole table dedicated to the types of water sources in our database. Let's dig into it and
figure out all the unique types of water sources we're dealing with.
3. Unpack the visits to water sources: The 'visits' table in our database is like a logbook of all the trips made to different water
sources. We need to unravel this logbook to understand the frequency and distribution of these visits. Let's identify which locations
have been visited more than a certain number of times.
4. Assess the quality of water sources: The quality of water sources is a pretty big deal. We'll turn to the water_quality table to
find records where the subjective_quality_score is within a certain range and the visit_count is above a certain threshold. This
should help us spot the water sources that are frequently visited and have a decent quality score.
5. Investigate any pollution issues: We can't overlook the pollution status of our water sources. Let's find those water sources where
the pollution_tests result came back as 'dirty' or 'biologically contaminated'. This will help us flag the areas that need immediate attention.
