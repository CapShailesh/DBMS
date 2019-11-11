CREATE TABLE Employee(Emp_id NUMBER PRIMARY KEY, Name VARCHAR(20), Salary NUMBER);

CREATE TABLE EmployeeNew(Emp_id NUMBER PRIMARY KEY, Name VARCHAR(20), Salary NUMBER);

INSERT INTO Employee VALUES(101, 'Shailesh', 50000);
INSERT INTO Employee VALUES(102, 'Virat', 25000);
INSERT INTO Employee VALUES(103, 'Rohit', 20000);
INSERT INTO Employee VALUES(104, 'Dhoni', 15000);
INSERT INTO Employee VALUES(105, 'Rahul', 10000);

SELECT * FROM Employee;

DECLARE 
    CURSOR Old IS SELECT * FROM Employee;
    CURSOR New(Id NUMBER) IS SELECT * FROM EmployeeNew WHERE Emp_id = Id;
    
        temp EmployeeNew%rowtype;

    cust_rec Employee%rowtype;

BEGIN
    OPEN Old;
    LOOP    
        FETCH Old INTO cust_rec;
        EXIT WHEN Old%NOTFOUND;
        
        OPEN New(cust_rec.Emp_id);
        FETCH NEW INTO temp;
        IF NEW%NOTFOUND THEN
            INSERT INTO EmployeeNew VALUES(cust_rec.Emp_id, cust_rec.Name, cust_rec.Salary);
        END IF;
        CLOSE New;
        
    END LOOP;
    CLOSE Old;
END;


DECLARE
    CURSOR Old(st number, en number) IS SELECT * FROM Employee WHERE Emp_id BETWEEN st AND en;
    CURSOR New IS SELECT Emp_id FROM EmployeeNew;
    
    emp_rec Employee%rowtype;
    empid EmployeeNew.Emp_id%type;
    flag NUMBER;
    st number;
    en number;
    
BEGIN
    st := 102;
    en := 105;
    OPEN Old(st, en);
    LOOP
        FETCH Old INTO emp_rec;
        EXIT WHEN Old%NOTFOUND;
        
        flag := 0;
        
        OPEN New;
        LOOP
            FETCH New INTO empid;
            EXIT WHEN New%NOTFOUND;
            
            IF emp_rec.Emp_id = empid THEN
                flag := 1;
            END IF;
                
                
        END LOOP;
        CLOSE NEW;
        
        IF flag = 0 THEN
            INSERT INTO EmployeeNew VALUES(emp_rec.Emp_id, emp_rec.Name, emp_rec.Salary);
        END IF;
        
    END LOOP;
    CLOSE Old;
END;

