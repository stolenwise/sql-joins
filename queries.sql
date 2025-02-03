-- write your queries here

--Query 1: Join the two tables
SELECT 
    o.id AS owners_id,
    o.first_name,
    o.last_name,
    v.id AS vehicle_id,
    v.make,
    v.model,
    v.year,
    v.price,
    v.owner_id
FROM owners o
FULL OUTER JOIN vehicles v 
ON o.id = v.owner_id
ORDER BY owner_id;
 owners_id | first_name | last_name | vehicle_id |  make  |  model  | year |  price   | owner_id 
-----------+------------+-----------+------------+--------+---------+------+----------+----------
         1 | Bob        | Hope      |          1 | Toyota | Corolla | 2002 |  2999.99 |        1
         1 | Bob        | Hope      |          2 | Honda  | Civic   | 2012 | 12999.99 |        1
         2 | Jane       | Smith     |          3 | Nissan | Altima  | 2016 | 23999.99 |        2
         2 | Jane       | Smith     |          4 | Subaru | Legacy  | 2006 |  5999.99 |        2
         3 | Melody     | Jones     |          5 | Ford   | F150    | 2012 |  2599.99 |        3
         3 | Melody     | Jones     |          6 | GMC    | Yukon   | 2016 | 12999.99 |        3
         4 | Sarah      | Palmer    |          7 | GMC    | Yukon   | 2014 | 22999.99 |        4
         4 | Sarah      | Palmer    |          8 | Toyota | Avalon  | 2009 | 12999.99 |        4
         4 | Sarah      | Palmer    |          9 | Toyota | Camry   | 2013 | 12999.99 |        4
         5 | Alex       | Miller    |         10 | Honda  | Civic   | 2001 |  7999.99 |        5
         6 | Shana      | Smith     |         11 | Nissan | Altima  | 1999 |  1899.99 |        6
         6 | Shana      | Smith     |         12 | Lexus  | ES350   | 1998 |  1599.99 |        6
         6 | Shana      | Smith     |         13 | BMW    | 300     | 2012 | 22999.99 |        6
         6 | Shana      | Smith     |         14 | BMW    | 700     | 2015 | 52999.99 |        6
         7 | Maya       | Malarkin  |            |        |         |      |          |         
(15 rows)

--Query 2:
SELECT o.id AS owners_id, o.first_name, o.last_name, COUNT(v.id) AS vehicle_count
FROM owners o
LEFT JOIN vehicles v ON o.id = v.owner_id
GROUP BY o.id, o.first_name, o.last_name
ORDER BY o.first_name;
 owners_id | first_name | last_name | vehicle_count 
-----------+------------+-----------+---------------
         5 | Alex       | Miller    |             1
         1 | Bob        | Hope      |             2
         2 | Jane       | Smith     |             2
         7 | Maya       | Malarkin  |             0
         3 | Melody     | Jones     |             2
         4 | Sarah      | Palmer    |             3
         6 | Shana      | Smith     |             4
(7 rows)

SELECT o.first_name, o.last_name, 
CAST(AVG(v.price) AS INTEGER) AS average_price, 
COUNT(v.id) AS vehicle_count 
FROM owners o LEFT JOIN vehicles v ON o.id = v.owner_id 
GROUP BY o.id, o.first_name, o.last_name HAVING COUNT(v.id) > 1 AND AVG(v.price) > 10000 
ORDER BY o.first_name DESC;
 first_name | last_name | average_price | vehicle_count 
------------+-----------+---------------+---------------
 Shana      | Smith     |         19875 |             4
 Sarah      | Palmer    |         16333 |             3
 Jane       | Smith     |         15000 |             2
(3 rows)


