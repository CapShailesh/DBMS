CREATE TABLE Customer(Cust_id NUMBER PRIMARY KEY, Name VARCHAR(20), total_purchase NUMBER);

CREATE TABLE Categories(Cust_id NUMBER , Name VARCHAR(20), Class VARCHAR(20), FOREIGN KEY(Cust_id) REFERENCES Customer(Cust_id));

INSERT INTO  Customer VALUES(101, 'Shailesh', 20000);
INSERT INTO  Customer VALUES(102, 'Virat', 15000)
INSERT INTO  Customer VALUES(103, 'Rohit', 9999);
INSERT INTO  Customer VALUES(104, 'Dhoni', 7500);
INSERT INTO  Customer VALUES(105, 'Rahul', 4500);

CREATE OR REPLACE FUNCTION fun_grade(Fcust_rec IN Customer%rowtype)
RETURN VARCHAR2
AS
class VARCHAR(20);
BEGIN
    
    IF(Fcust_rec.total_purchase BETWEEN 10000 AND 20000) THEN
        class := 'PLATINUM';
    ELSIF(Fcust_rec.total_purchase BETWEEN 5000 AND 9999) THEN
        class := 'GOLD';
    ELSIF(Fcust_rec.total_purchase <= 4999) THEN
        class := 'SILVER';
    END IF;
    RETURN class;
END;
/

DECLARE
    class VARCHAR(20);
    CURSOR C1 IS SELECT * FROM Customer;
    cust_rec Customer%rowtype;
BEGIN
    OPEN C1;
    DELETE FROM Categories;
    LOOP
        FETCH C1 INTO cust_rec;
        EXIT WHEN C1%NOTFOUND;
        class := fun_grade(cust_rec);
        INSERT INTO Categories VALUES(cust_rec.Cust_id, cust_rec.Name, class);
    END LOOP;
END;
        




