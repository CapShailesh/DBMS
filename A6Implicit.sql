CREATE TABLE Employee(Emp_id NUMBER PRIMARY KEY, Name VARCHAR(20), Salary NUMBER);

CREATE TABLE EmployeeNew(Emp_id NUMBER PRIMARY KEY, Name VARCHAR(20), Salary NUMBER);

INSERT INTO Employee VALUES(101, 'Shailesh', 50000);
INSERT INTO Employee VALUES(102, 'Virat', 25000);
INSERT INTO Employee VALUES(103, 'Rohit', 20000);
INSERT INTO Employee VALUES(104, 'Dhoni', 15000);
INSERT INTO Employee VALUES(105, 'Rahul', 10000);

SELECT * FROM Employee;


BEGIN
    UPDATE Employee SET Salary = Salary + 500 WHERE Emp_id = 101;
    IF SQL%FOUND THEN
        dbms_output.put_line('Number of rows updated : ' || SQL%ROWCOUNT);
    ELSIF SQL%NOTFOUND THEN
        dbms_output.put_line('No Data Found!');
    END IF;
END;

