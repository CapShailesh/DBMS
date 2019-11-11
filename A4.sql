1. Find Customer details and order details using NATURAL JOIN.

mysql> select * from Customer natural join OrderT;
+---------+------------+------------+--------------+-----------+--------+------------+----------+------+------+------------+
| cust_no | cust_fname | cust_lname | cust_company | cust_addr | city   | cust_phone | order_no | ISBN | qty  | odate      |
+---------+------------+------------+--------------+-----------+--------+------------+----------+------+------+------------+
|     101 | Shailesh   | Borate     | abc          | Baner     | Pune   | 9421663873 |      501 |  401 |    2 | 2019-11-05 |
|     102 | Pravin     | Tambe      | abc          | Baner     | Pune   | 9421663873 |      502 |  403 |    3 | 2019-11-06 |
|     103 | Hardik     | Pandya     | abc          | Baner     | Mumbai | 9421663873 |      503 |  405 |    1 | 2019-11-07 |
|     104 | Hemant     | Shami      | abc          | Baner     | Delhi  | 9421663873 |      504 |  406 |    5 | 2019-11-05 |
+---------+------------+------------+--------------+-----------+--------+------------+----------+------+------+------------+
4 rows in set (0.00 sec)

2. Find the book_ title, author_name, country. (INNER JOIN)

mysql> select title, Author.author_name, Author.country from Book inner join Author on Book.author_no=Author.author_no;
+--------------+-------------+-----------+
| title        | author_name | country   |
+--------------+-------------+-----------+
| Harry Potter | Chetan      | India     |
| Radhe        | Mark        | Australia |
| Shiva        | Suhas       | India     |
| Maze Runner  | Stine       | America   |
| Chava        | Stine       | America   |
| Hercules     | Chetan      | India     |
+--------------+-------------+-----------+
6 rows in set (0.00 sec)

3. Find the customer ID, name and order_no of customers who have never placed an order.
(LEFT/RIGHT)

mysql> select Customer.cust_no, cust_fname, cust_lname, order_no from Customer Left join OrderT on Customer.cust_no = OrderT.cust_no where OrderT.order_no IS NULL;
+---------+------------+-------------+----------+
| cust_no | cust_fname | cust_lname  | order_no |
+---------+------------+-------------+----------+
|     105 | Purva      | Golegaonkar |     NULL |
|     106 | Priya      | Golegaonkar |     NULL |
|     107 | Harish     | Rahane      |     NULL |
|     108 | Virat      | Kohli       |     NULL |
|     109 | Rohit      | Sharma      |     NULL |
|     110 | MS         | Dhoni       |     NULL |
+---------+------------+-------------+----------+
6 rows in set (0.00 sec)

4. Find the Title, ISBN, order_no of the books for which order is not placed. (LEFT/RIGHT)

mysql> select Book.ISBN, title from Book left join OrderT on Book.ISBN = OrderT.ISBN where order_no IS NULL;
+------+-------------+
| ISBN | title       |
+------+-------------+
|  402 | Radhe       |
|  404 | Maze Runner |
+------+-------------+
2 rows in set (0.00 sec)

5. Display cust_fname, title,author_no,publisher_year where ISBN=1234. (JOINING more than 2
tables)

mysql> select cust_fname, title, author_no, pub_year from Customer natural join OrderT natural join Book where ISBN = 401;
+------------+--------------+-----------+----------+
| cust_fname | title        | author_no | pub_year |
+------------+--------------+-----------+----------+
| Shailesh   | Harry Potter |       201 |     2000 |
+------------+--------------+-----------+----------+
1 row in set (0.00 sec)

mysql> select cust_fname, title, author_no, pub_year from Customer inner join OrderT on Customer.cust_no = OrderT.cust_no inner join Book on OrderT.ISBN = Book.ISBN where Book.ISBN = 401;
+------------+--------------+-----------+----------+
| cust_fname | title        | author_no | pub_year |
+------------+--------------+-----------+----------+
| Shailesh   | Harry Potter |       201 |     2000 |
+------------+--------------+-----------+----------+
1 row in set (0.00 sec)

6. Display the total number of books and customer name.( USE OF COUNT, ANY JOIN)

mysql> select cust_fname, count(qty) from Customer Inner join OrderT on Customer.cust_no = OrderT.cust_no group by cust_fname;
+------------+------------+
| cust_fname | count(qty) |
+------------+------------+
| Hardik     |          1 |
| Hemant     |          1 |
| Pravin     |          1 |
| Shailesh   |          1 |
+------------+------------+
4 rows in set (0.00 sec)

mysql> select * from OrderT;
+----------+---------+------+------+------------+
| order_no | cust_no | ISBN | qty  | odate      |
+----------+---------+------+------+------------+
|      501 |     101 |  401 |    2 | 2019-11-05 |
|      502 |     102 |  403 |    3 | 2019-11-06 |
|      503 |     103 |  405 |    1 | 2019-11-07 |
|      504 |     104 |  406 |    5 | 2019-11-05 |
+----------+---------+------+------+------------+
4 rows in set (0.00 sec)

mysql> insert into OrderT values(505, 101, 402, 1, '2019-11-04');
Query OK, 1 row affected (0.04 sec)

mysql> select cust_fname, count(qty) from Customer Inner join OrderT on Customer.cust_no = OrderT.cust_no group by cust_fname;
+------------+------------+
| cust_fname | count(qty) |
+------------+------------+
| Hardik     |          1 |
| Hemant     |          1 |
| Pravin     |          1 |
| Shailesh   |          2 |
+------------+------------+
4 rows in set (0.00 sec)

7. List the cust_id, order_no and ISBN with books having title 'mysql'. (sub query- IN) 
mysql> select cust_no, order_no, ISBN From OrderT where OrderT.ISBN = (select ISBN from Book where title = "Harry Potter");
+---------+----------+------+
| cust_no | order_no | ISBN |
+---------+----------+------+
|     101 |      501 |  401 |
+---------+----------+------+
1 row in set (0.00 sec)

8. Find the names of all the companies that ordered books in the year 2015. (sub query, Between)

mysql> select cust_company From Customer Where cust_no In (Select cust_no from OrderT where year(odate) between 2019 and 2020);
+--------------+
| cust_company |
+--------------+
| abc          |
| abc          |
| abc          |
| abc          |
+--------------+
4 rows in set (0.00 sec)

mysql> create view complex_view  as select Author.author_no, author_name, title from Author Inner join Book on Author.author_no = Book.author_no; Query OK, 0 rows affected (0.33 sec)

mysql> select * from complex_view;
+-----------+-------------+--------------+
| author_no | author_name | title        |
+-----------+-------------+--------------+
|       201 | Chetan      | Harry Potter |
|       202 | Mark        | Radhe        |
|       203 | Suhas       | Shiva        |
|       204 | Stine       | Maze Runner  |
|       204 | Stine       | Chava        |
|       201 | Chetan      | Hercules     |
+-----------+-------------+--------------+
6 rows in set (0.00 sec)

mysql> create view simple_view as select cust_no, cust_fname, city from Customer;
Query OK, 0 rows affected (0.03 sec)

mysql> select * from simple_view;
+---------+------------+------------+
| cust_no | cust_fname | city       |
+---------+------------+------------+
|     101 | Shailesh   | Pune       |
|     102 | Pravin     | Pune       |
|     103 | Hardik     | Mumbai     |
|     104 | Hemant     | Delhi      |
|     105 | Purva      | Pune       |
|     106 | Priya      | Mumbai     |
|     107 | Harish     | Pune       |
|     108 | Virat      | Aurangabad |
|     109 | Rohit      | Nashik     |
|     110 | MS         | Chennai    |
+---------+------------+------------+
10 rows in set (0.00 sec)

mysql> insert into simple_view values(111, 'Dinesh', 'Nagpur');
Query OK, 1 row affected (0.03 sec)

mysql> select * from simple_view;
+---------+------------+------------+
| cust_no | cust_fname | city       |
+---------+------------+------------+
|     101 | Shailesh   | Pune       |
|     102 | Pravin     | Pune       |
|     103 | Hardik     | Mumbai     |
|     104 | Hemant     | Delhi      |
|     105 | Purva      | Pune       |
|     106 | Priya      | Mumbai     |
|     107 | Harish     | Pune       |
|     108 | Virat      | Aurangabad |
|     109 | Rohit      | Nashik     |
|     110 | MS         | Chennai    |
|     111 | Dinesh     | Nagpur     |
+---------+------------+------------+
11 rows in set (0.00 sec)

mysql> select * from Customer;
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
|     111 | Dinesh     | NULL        | NULL         | NULL      | Nagpur     |       NULL |
+---------+------------+-------------+--------------+-----------+------------+------------+
11 rows in set (0.00 sec)

 delete from simple_view where cust_no = 111;
Query OK, 1 row affected (0.13 sec)

mysql> select * from Customer;
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
10 rows in set (0.00 sec)

mysql> select * from simple_view;
+---------+------------+------------+
| cust_no | cust_fname | city       |
+---------+------------+------------+
|     101 | Shailesh   | Pune       |
|     102 | Pravin     | Pune       |
|     103 | Hardik     | Mumbai     |
|     104 | Hemant     | Delhi      |
|     105 | Purva      | Pune       |
|     106 | Priya      | Mumbai     |   
|     107 | Harish     | Pune       |
|     108 | Virat      | Aurangabad |
|     109 | Rohit      | Nashik     |
|     110 | MS         | Chennai    |
+---------+------------+------------+
10 rows in set (0.00 sec)

mysql> 



