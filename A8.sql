create table Student(rollno number, name varchar(20), doa date, branch varchar(20), percent number(10, 2), status varchar(20))

create table Alumni(rollno number, name varchar(20), doa date, branch varchar(20), percent number(10, 2), status varchar(20))

INSERT INTO Student VALUES(101, 'Shailesh', '26-JUL-19', 'COMP', 94.8, 'PURSUING');
INSERT INTO Student VALUES(102, 'Rohit', '26-JUL-19', 'COMP', 94.0, 'PURSUING');
INSERT INTO Student VALUES(103, 'Virat', '26-JUL-19', 'COMP', 93.0, 'PURSUING');
INSERT INTO Student VALUES(104, 'Dhoni', '24-JUL-19', 'COMP', 92.0, 'PURSUING');
INSERT INTO Student VALUES(105, 'Rahul', '24-JUL-19', 'COMP', 92.0, 'PURSUING');

create or replace 
trigger updel
before
update or delete
on student
for each row

declare
c number := 0;
begin

    select count(*) into c from alumni where rollno = :old.rollno;
    if c = 0 then
        insert into alumni values (:old.rollno, :old.name, :old.doa, :old.branch, :old.percent, :old.status);
    else
        update alumni set name = :old.name, doa = :old.doa, branch = :old.branch, percent = :old.percent, status = :old.status 
        where rollno = :old.rollno;
    end if;
end;


    
  
