CREATE TABLE Customer(Cust_id NUMBER PRIMARY KEY, Name VARCHAR(20), DateOfPayment DATE, Scheme VARCHAR(20), Status  VARCHAR(10))

CREATE TABLE Fine(Cust_id NUMBER, DateOfPayment DATE, Amount NUMBER, Foreign key(Cust_id) references Customer(Cust_id))

DECLARE
id int;
scheme varchar2(20);
diff number;
cust_record Customer%rowtype;
alreadyPaid Exception;

BEGIN   
    id := 102;
    scheme := 'abc';
    
    SELECT * INTO cust_record FROM Customer WHERE Cust_id = id;
    SELECT trunc(sysdate) - cust_record.DateOfPayment INTO diff FROM Customer WHERE Cust_id = id;
    
    dbms_output.put_line('Cust_id : ' || cust_record.Cust_id || ' Name : ' || cust_record.Name || ' Date Of Payment : ' || cust_record.DateOfPayment);
    
    dbms_output.put_line('Total differnece in days is ' || diff);
    
    
    
    IF(cust_record.Status = 'P') THEN
        raise alreadyPaid;
    END IF;
    
    IF(diff < 15) THEN
        dbms_output.put_line('Fine Amount : ' || 0);
        UPDATE Customer SET Status = 'P' WHERE Cust_id = id;
        INSERT INTO Fine VALUES(id, trunc(sysdate), 0);
    ELSIF(diff >= 15 AND diff < 30) THEN
         dbms_output.put_line('Fine Amount : ' || (diff-15)*5);
        UPDATE Customer SET Status = 'P' WHERE Cust_id = id;
        INSERT INTO Fine VALUES(id, trunc(sysdate), (diff-15)*5);
    ELSIF(diff >= 30) THEN
        dbms_output.put_line('Fine Amount : ' || ((diff-30)*50 + (15)*5));
        UPDATE Customer SET Status = 'P' WHERE Cust_id = id;
        INSERT INTO Fine VALUES(id, trunc(sysdate), ((diff-30)*50 + (15)*5));
        
    END IF;
    
EXCEPTION
    WHEN alreadyPaid THEN
        dbms_output.put_line('Book already Returned!');
        
END;
