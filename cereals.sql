drop Database if exists cereals;
create database cereals;
use cereals;
-- 1. Add index name fast on name
create index fast on cereals (name);

-- 2. Describe the schema of the table
describe cereals;

-- 3. Create view name as see where users can not see type column
create view see as
select name, mfr, calories, protein, fat, sodium, fiber, carbo, sugars, potass, vitamins, shelf, weight, cups, rating
from cereals;

-- 4. Rename the view as saw
create view saw as
select * from see;

-- 5. Count how many are cold cereals
select count(*) as cold_cereal_count
from cereals
where type = 'C';

-- 6. Count how many cereals are kept in shelf 3
select count(*) as shelf_3_cereal_count
from cereals
where shelf = 3;

-- 7. Arrange the table from high to low according to ratings
select * from cereals
order by rating desc;

-- 8. Suggest some column/s which can be Primary key
-- Potential primary key columns could be 'name' if it is unique for each cereal. 
-- Alternatively, a new unique identifier column (e.g., 'id') could be added.

-- 9. Find average of calories of hot cereal and cold cereal in one query
select type, avg(calories) as average_calories
from cereals
group by type;

-- 10. Add new column as HL_Calories where more than average calories should be categorized as HIGH and less than average calories should be categorized as LOW
alter table cereals add column hl_calories varchar(10);
update cereals
set hl_calories = case
    when calories > (select avg(calories) from cereals) then 'HIGH'
    when calories <= (select avg(calories) from cereals) then 'LOW'
end;

-- 11. List only those cereals whose name begins with B
select * from cereals
where name like 'B%';

-- 12. List only those cereals whose name begins with F
select * from cereals
where name like 'F%';

-- 13. List only those cereals whose name ends with s
select * from cereals
where name like '%s';

-- 14. Select only those records which are HIGH in column HL_calories and mail to jeevan.raj@imarticus.com
select * from cereals
where hl_calories = 'HIGH';
-- Save the result as a CSV or appropriate file format named <your_first_name_cereals_high>

-- 15. Find maximum of ratings
select max(rating) as max_rating from cereals;

-- 16. Find average ratings of those were High and Low calories
select hl_calories, avg(rating) as average_rating
from cereals
group by hl_calories;

-- 17. Create two examples of Sub Queries of your choice and give explanation in the script itself with remarks by using #
-- Example 1: Find cereals with calories higher than the average
select name, calories
from cereals
where calories > (select avg(calories) from cereals);
# This query finds all cereals with calorie count higher than the average calorie count.

-- Example 2: Find the highest-rated cereal from each manufacturer
select mfr, name, rating
from cereals c1
where rating = (select max(rating) from cereals c2 where c2.mfr = c1.mfr);
# This query finds the highest-rated cereal for each manufacturer.

-- 18. Remove column fat
alter table cereals drop column fat;

-- 19. Count records for each manufacturer [mfr]
select mfr, count(*) as cereal_count
from cereals
group by mfr;

-- 20. Select name, calories and ratings only
select name, calories, rating from cereals;