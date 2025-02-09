# SQL-Script-for-Cereal-Database
This SQL script is designed to create and manage a database named "cereals", perform various queries, and manipulate data efficiently.
 The key functionalities covered in this script include:

Database and Index Creation

Drops the existing database (if any) and creates a new database named cereals.
Adds an index named fast on the name column to optimize search performance.
Schema and View Management

Describes the table structure.
Creates a view see that excludes the type column.
Renames the view to saw.
Data Analysis and Queries

Counts the number of cold cereals.
Counts cereals stored on shelf 3.
Lists cereals ordered by ratings (highest to lowest).
Suggests potential primary key options.
Calculates the average calories for both hot and cold cereals.
Data Modification and Filtering

Adds a new column HL_Calories to classify cereals as HIGH or LOW based on average calories.
Filters cereals based on specific conditions, such as:
Names starting with B or F.
Names ending with s.
Identifies cereals that have HIGH calories and need to be sent via email.
Statistical Analysis

Determines the maximum rating among all cereals.
Calculates the average rating for cereals categorized as HIGH and LOW in calories.
Subqueries for Advanced Analysis

Identifies cereals with above-average calories.
Finds the highest-rated cereal per manufacturer using a subquery.
Table Modification

Removes the fat column from the table.
Aggregations and Data Extraction

Counts the number of cereals per manufacturer.
Extracts only the name, calories, and rating from the table.
