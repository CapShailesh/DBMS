CREATE TABLE Customer(Cust_id NUMBER PRIMARY KEY, Name VARCHAR(20), total_purchase NUMBER);

CREATE TABLE Categories(Cust_id NUMBER , Name VARCHAR(20), Class VARCHAR(20), FOREIGN KEY(Cust_id) REFERENCES Customer(Cust_id));

INSERT INTO  Customer VALUES(101, 'Shailesh', 20000);
INSERT INTO  Customer VALUES(102, 'Virat', 15000)
INSERT INTO  Customer VALUES(103, 'Rohit', 9999);
INSERT INTO  Customer VALUES(104, 'Dhoni', 7500);
INSERT INTO  Customer VALUES(105, 'Rahul', 4500);

CREATE OR REPLACE PROCEDURE proc_grade(Pcust_rec IN Customer%rowtype)
IS
BEGIN
    
    IF(Pcust_rec.total_purchase BETWEEN 10000 AND 20000) THEN
        INSERT INTO Categories VALUES(Pcust_rec.Cust_id, Pcust_rec.Name, 'PLATINUM');
    ELSIF(Pcust_rec.total_purchase BETWEEN 5000 and 9999) THEN
        INSERT INTO Categories VALUES(Pcust_rec.Cust_id, Pcust_rec.Name, 'GOLD');
    ELSIF(Pcust_rec.total_purchase <= 4999) THEN
        INSERT INTO Categories VALUES(Pcust_rec.Cust_id, Pcust_rec.Name, 'SILVER');
    END IF;
    
    
END;
/
DECLARE
    cust_record Customer%rowtype;
    CURSOR C1 IS SELECT * FROM Customer;
BEGIN
    OPEN C1;
    DELETE FROM Categories;
    LOOP
        FETCH C1 INTO cust_record;
        EXIT WHEN C1%NOTFOUND;
        proc_grade(cust_record);
        
    END LOOP;
    CLOSE C1;
    
END;


        
SELECT * FROM Customer;
SELECT * FROM Categories;    


        
    


