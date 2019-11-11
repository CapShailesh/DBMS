CREATE TABLE Customer(cust_no int PRIMARY KEY, cust_fname varchar(20), cust_lname varchar(20), cust_company varchar(20), cust_addr varchar(20), city varchar(20), cust_phone bigint(15));

CREATE TABLE Author(author_no int PRIMARY KEY, author_name VARCHAR(20), country VARCHAR(20));

CREATE TABLE Publisher(publisher_no INT PRIMARY KEY, publisher_name VARCHAR(20), publisher_addr VARCHAR(20), byear YEAR);

CREATE TABLE Book(ISBN INT PRIMARY KEY, title VARCHAR(20), unit_price INT, author_no INT, publisher_no INT, pub_year YEAR, FOREIGN KEY(author_no) REFERENCES Author(author_no), FOREIGN KEY(publisher_no) REFERENCES Publisher(publisher_no));

CREATE TABLE OrderT(order_no INT PRIMARY KEY, cust_no INT, ISBN INT, qty INT, odate DATE, FOREIGN KEY(cust_no) REFERENCES Customer(cust_no),   
FOREIGN KEY(ISBN) REFERENCES Book(ISBN));

insert into Customer values(101, 'Shailesh', 'Borate', 'abc', 'Baner', 'Pune', 9421663873);

mysql> insert into Customer values(102, 'Pravin', 'Tambe', 'abc', 'Baner', 'Pune', 9421663873);

mysql> insert into Customer values(103, 'Hardik', 'Pandya', 'abc', 'Baner', 'Mumbai', 9421663873);

mysql> insert into Customer values(104, 'Hemant', 'Shami', 'abc', 'Baner', 'Delhi', 9421663873);
Query OK, 1 row affected (0.42 sec)

mysql> insert into Customer values(105, 'Purva', 'Golegaonkar', 'abc', 'Baner', 'Pune', 9421663873);
Query OK, 1 row affected (0.04 sec)

mysql> insert into Customer values(106, 'Priya', 'Golegaonkar', 'abc', 'Baner', 'Mumbai', 9421663873);
Query OK, 1 row affected (0.04 sec)

mysql> insert into Customer values(107, 'Harish', 'Rahane', 'abc', 'Balewadi', 'Pune', 9421663873);
Query OK, 1 row affected (0.89 sec)

mysql> insert into Customer values(108, 'Virat', 'Kohli', 'abc', 'Balewadi', 'Aurangabad', 9421663873);
Query OK, 1 row affected (0.39 sec)

mysql> insert into Customer values(109, 'Rohit', 'Sharma', 'abc', 'Balewadi', 'Nashik', 9421663873);
Query OK, 1 row affected (0.08 sec)

mysql> insert into Customer values(110, 'MS', 'Dhoni', 'abc', 'Balewadi', 'Chennai', 9421663873);

uery OK, 1 row affected (0.03 sec)
+---------+------------+-------------+--------------+-----------+------------+------------+
| cust_no | cust_fname | cust_lname  | cust_company | cust_addr | city       | cust_phone |
+---------+------------+-------------+--------------+-----------+------------+------------+
|     101 | Shailesh   | Borate      | abc          | Baner     | Pune       | 9421663873 |
|     102 | Pravin     | Tambe       | abc          | Baner     | Pune       | 9421663873 |
|     103 | Hardik     | Pandya      | abc          | Baner     | Mumbai     | 9421663873 |
|     104 | Hemant     | Shami       | abc          | Baner     | Delhi      | 9421663873 |
|     105 | Purva      | Golegaonkar | abc          | Baner     | Pune       | 9421663873 |
|     106 | Priya      | Golegaonkar | abc          | Baner     | Mumbai     | 9421663873 |
|     107 | Harish     | Rahane      | abc          | Balewadi  | Pune       | 9421663873 |
|     108 | Virat      | Kohli       | abc          | Balewadi  | Aurangabad | 9421663873 |
|     109 | Rohit      | Sharma      | abc          | Balewadi  | Nashik     | 9421663873 |
|     110 | MS         | Dhoni       | abc          | Balewadi  | Chennai    | 9421663873 |
+---------+------------+-------------+--------------+-----------+------------+------------+

mysql> insert into Author Values(201, 'Chetan', 'India');
Query OK, 1 row affected (0.04 sec)

mysql> insert into Author Values(202, 'Mark', 'Australia');
Query OK, 1 row affected (0.03 sec)

mysql> insert into Author Values(203, 'Suhas', 'India');
Query OK, 1 row affected (0.04 sec)

mysql> insert into Author Values(204, 'Stine', 'America');
Query OK, 1 row affected (0.04 sec)



mysql> select * from Author;;
+-----------+-------------+-----------+
| author_no | author_name | country   |
+-----------+-------------+-----------+
|       201 | Chetan      | India     |
|       202 | Mark        | Australia |
|       203 | Suhas       | India     |
|       204 | Stine       | America   |
+-----------+-------------+-----------+

4 rows in set (0.00 sec)

mysql> insert into Publisher values(301, 'Continental', 'Pune', 2015);
Query OK, 1 row affected (0.04 sec)

mysql> insert into Publisher values(302, 'Goosebumps', 'America', 2016);
Query OK, 1 row affected (0.04 sec)

mysql> insert into Publisher values(303, 'Penguin', 'America', 2016);
Query OK, 1 row affected (0.71 sec)


mysql> insert into publisher values(304, 'Mcmilan', 'England', 2014)

mysql> select * from Publisher;
+--------------+----------------+----------------+-------+
| publisher_no | publisher_name | publisher_addr | byear |
+--------------+----------------+----------------+-------+
|          301 | Continental    | Pune           |  2015 |
|          302 | Goosebumps     | America        |  2016 |
|          303 | Penguin        | America        |  2016 |
|          304 | Mcmilan        | England        |  2014 |
+--------------+----------------+----------------+-------+
4 rows in set (0.00 sec)

mysql> insert into Book values(401, 'Harry Potter', 350, 201, 301, 2000);
Query OK, 1 row affected (0.05 sec)

mysql> insert into Book values(402, 'Radhe', 300, 202, 302, 2004);
Query OK, 1 row affected (0.03 sec)

mysql> insert into Book values(403, 'Shiva', 400, 203, 303, 2006);
Query OK, 1 row affected (0.35 sec)

mysql> insert into Book values(404, 'Maze Runner', 200, 204, 304, 2015);
Query OK, 1 row affected (0.40 sec)

mysql> insert into Book values(405, 'Chava', 500, 204, 304, 2015);
Query OK, 1 row affected (0.04 sec)

mysql> insert into Book values(406, 'Hercules', 375, 201, 301, 2000);
Query OK, 1 row affected (0.32 sec)

mysql> select * from Book;
+------+--------------+------------+-----------+--------------+----------+
| ISBN | title        | unit_price | author_no | publisher_no | pub_year |
+------+--------------+------------+-----------+--------------+----------+
|  401 | Harry Potter |        350 |       201 |          301 |     2000 |
|  402 | Radhe        |        300 |       202 |          302 |     2004 |
|  403 | Shiva        |        400 |       203 |          303 |     2006 |
|  404 | Maze Runner  |        200 |       204 |          304 |     2015 |
|  405 | Chava        |        500 |       204 |          304 |     2015 |
|  406 | Hercules     |        375 |       201 |          301 |     2000 |
+------+--------------+------------+-----------+--------------+----------+
6 rows in set (0.00 sec)

mysql> insert into OrderT values(501, 101, 401, 2, '2019-11-05');
Query OK, 1 row affected (0.05 sec)

mysql> insert into OrderT values(502, 102, 403, 3, '2019-11-06');
Query OK, 1 row affected (0.53 sec)

mysql> insert into OrderT values(503, 103, 405, 1, '2019-11-07');
Query OK, 1 row affected (0.86 sec)

mysql> insert into OrderT values(504, 104, 406, 5, '2019-11-05');


mysql> select * from OrderT;
+----------+---------+------+------+------------+
| order_no | cust_no | ISBN | qty  | odate      |
+----------+---------+------+------+------------+
|      501 |     101 |  401 |    2 | 2019-11-05 |
|      502 |     102 |  403 |    3 | 2019-11-06 |
|      503 |     103 |  405 |    1 | 2019-11-07 |
|      504 |     104 |  406 |    5 | 2019-11-05 |
+----------+---------+------+------+------------+
4 rows in set (0.01 sec)

2. Display all customer details with city pune and mumbai and customer first name starting with
'p' or 'h'.

mysql> select * from Customer where (city = "Pune" or city = "Mumbai") and (cust_fname like "P%" or cust_fname like "H%");
+---------+------------+-------------+--------------+-----------+--------+------------+
| cust_no | cust_fname | cust_lname  | cust_company | cust_addr | city   | cust_phone |
+---------+------------+-------------+--------------+-----------+--------+------------+
|     102 | Pravin     | Tambe       | abc          | Baner     | Pune   | 9421663873 |
|     103 | Hardik     | Pandya      | abc          | Baner     | Mumbai | 9421663873 |
|     105 | Purva      | Golegaonkar | abc          | Baner     | Pune   | 9421663873 |
|     106 | Priya      | Golegaonkar | abc          | Baner     | Mumbai | 9421663873 |
|     107 | Harish     | Rahane      | abc          | Balewadi  | Pune   | 9421663873 |
+---------+------------+-------------+--------------+-----------+--------+------------+
5 rows in set (0.00 sec)

3. lists the number of different customer cities.(use of distinct)

mysql> select count(distinct city) from Customer
    -> ;
+----------------------+
| count(distinct city) |
+----------------------+
|                    6 |
+----------------------+

mysql> select distinct city from Customer;
+------------+
| city       |
+------------+
| Pune       |
| Mumbai     |
| Delhi      |
| Aurangabad |
| Nashik     |
| Chennai    |
+------------+
6 rows in set (0.00 sec)

4. Give 5% increase in price of the books with publishing year 2015. ( use of update)
mysql> select * from Book;
+------+--------------+------------+-----------+--------------+----------+
| ISBN | title        | unit_price | author_no | publisher_no | pub_year |
+------+--------------+------------+-----------+--------------+----------+
|  401 | Harry Potter |        350 |       201 |          301 |     2000 |
|  402 | Radhe        |        300 |       202 |          302 |     2004 |
|  403 | Shiva        |        400 |       203 |          303 |     2006 |
|  404 | Maze Runner  |        200 |       204 |          304 |     2015 |
|  405 | Chava        |        500 |       204 |          304 |     2015 |
|  406 | Hercules     |        375 |       201 |          301 |     2000 |
+------+--------------+------------+-----------+--------------+----------+
6 rows in set (0.00 sec)

mysql> Update Book set unit_price = 1.05*unit_price where pub_year = 2015;
Query OK, 2 rows affected (1.33 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> select * from Book;
+------+--------------+------------+-----------+--------------+----------+
| ISBN | title        | unit_price | author_no | publisher_no | pub_year |
+------+--------------+------------+-----------+--------------+----------+
|  401 | Harry Potter |        350 |       201 |          301 |     2000 |
|  402 | Radhe        |        300 |       202 |          302 |     2004 |
|  403 | Shiva        |        400 |       203 |          303 |     2006 |
|  404 | Maze Runner  |        210 |       204 |          304 |     2015 |
|  405 | Chava        |        525 |       204 |          304 |     2015 |
|  406 | Hercules     |        375 |       201 |          301 |     2000 |
+------+--------------+------------+-----------+--------------+----------+
6 rows in set (0.00 sec)

mysql> 

6. Find the names of authors living in India or Australia (use of UNION)
mysql> select * from Author;
+-----------+-------------+-----------+
| author_no | author_name | country   |
+-----------+-------------+-----------+
|       201 | Chetan      | India     |
|       202 | Mark        | Australia |
|       203 | Suhas       | India     |
|       204 | Stine       | America   |
+-----------+-------------+-----------+
4 rows in set (0.00 sec)

mysql> select author_name, country from Author where country = "India" Union select author_name, country from Author where country = "Australia";
+-------------+-----------+
| author_name | country   |
+-------------+-----------+
| Chetan      | India     |
| Suhas       | India     |
| Mark        | Australia |
+-------------+-----------+
3 rows in set (0.00 sec)

7. Find the publishers who are established in year 2015 as well as in 2016 (use of INTERSECT)

mysql> select * from Publisher where byear = 2015 or byear = 2016;
+--------------+----------------+----------------+-------+
| publisher_no | publisher_name | publisher_addr | byear |
+--------------+----------------+----------------+-------+
|          301 | Continental    | Pune           |  2015 |
|          302 | Goosebumps     | America        |  2016 |
|          303 | Penguin        | America        |  2016 |
+--------------+----------------+----------------+-------+
3 rows in set (0.00 sec)

8. Find the book having maximum price and find titles of book having price between 300 and 400.
(use of max and between)

select title, unit_price from Book where unit_price = (select max(unit_price) from Book);
+-------+------------+
| title | unit_price |
+-------+------------+
| Chava |        525 |
+-------+------------+
1 row in set (0.00 sec)

mysql> select title, unit_price from Book where unit_price between 300 and 400;
+--------------+------------+
| title        | unit_price |
+--------------+------------+
| Harry Potter |        350 |
| Radhe        |        300 |
| Shiva        |        400 |
| Hercules     |        375 |
+--------------+------------+
4 rows in set (0.00 sec)

9. Display all titles of books with price and published year in decreasing order of publishing year.

mysql> select title, unit_price, pub_year from Book order by pub_year DESC;
+--------------+------------+----------+
| title        | unit_price | pub_year |
+--------------+------------+----------+
| Maze Runner  |        210 |     2015 |
| Chava        |        525 |     2015 |
| Shiva        |        400 |     2006 |
| Radhe        |        300 |     2004 |
| Harry Potter |        350 |     2000 |
| Hercules     |        375 |     2000 |
+--------------+------------+----------+
6 rows in set (0.00 sec)

10. Display title,author_no and publisher_no of all books published in 2000,2004,2006. (use of IN)
mysql> select title, author_no, publisher_no from Book where pub_year in (2000, 2004, 2006);
+--------------+-----------+--------------+
| title        | author_no | publisher_no |
+--------------+-----------+--------------+
| Harry Potter |       201 |          301 |
| Radhe        |       202 |          302 |
| Shiva        |       203 |          303 |
| Hercules     |       201 |          301 |
+--------------+-----------+--------------+
4 rows in set (0.00 sec)



