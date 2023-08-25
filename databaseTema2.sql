CREATE DATABASE IF NOT EXISTS tema2;



create table tema2.Person (
	id int not null,
    name varchar(255) not null,
    emailAddress varchar(255), 
    phoneNumber varchar(50),
    primary key (id),
    addressStreet varchar(255),
    addressPostcode int,
    foreign key (addressStreet, addressPostcode) references Address(street, postalCode)
);

CREATE TABLE tema2.Address(
	street varchar(255) not null,
    city varchar(255) not null,
    state varchar(255) not null,
    postalCode int,
    country varchar(255) not null,
    primary key (street, postalCode)
);

create table tema2.Student(
	studentID int not null,
    studentNumber int,
    averageMark int,
    professorID int,
    staffNumberS int,
    yearsOfServiceS int,
    foreign key (studentID) references Person(id),
    foreign key (staffNumberS, yearsOfServiceS) references Professor(staffNumber, yearsOfService),
	primary key (studentID)
);

create table tema2.Professor(
    salary int,
    staffNumber int not null, 
    yearsOfService int not null, 
    numberOfClasses int,
    personID int,
    foreign key (personID) references Person(id),
    primary key (staffNumber, yearsOfService)
);


-- Inserting into tema2.Address
INSERT INTO tema2.Address (street, city, state, postalCode, country) VALUES
('123 Main Street', 'Springfield', 'IL', 12345, 'USA');

INSERT INTO tema2.Address (street, city, state, postalCode, country) VALUES
('456 Elm Street', 'Cleveland', 'OH', 67890, 'USA');

-- Inserting into tema2.Person
INSERT INTO tema2.Person (id, name, emailAddress, phoneNumber, addressStreet, addressPostcode) VALUES
(1, 'John Smith', 'john@example.com', '123-456-7890', '123 Main Street', 12345);

INSERT INTO tema2.Person (id, name, emailAddress, phoneNumber, addressStreet, addressPostcode) VALUES
(2, 'Jane Doe', 'jane@example.com', '987-654-3210', '456 Elm Street', 67890);

-- Inserting into tema2.Student
INSERT INTO tema2.Student (studentID, studentNumber, averageMark, professorID, staffNumberS, yearsOfServiceS) VALUES
(1, 1001, 85, 1, 123, 5);

INSERT INTO tema2.Student (studentID, studentNumber, averageMark, professorID, staffNumberS, yearsOfServiceS) VALUES
(2, 1002, 92, 2, 456, 3);

-- Inserting into tema2.Professor
INSERT INTO tema2.Professor (salary, staffNumber, yearsOfService, numberOfClasses, personID) VALUES
(75000, 123, 5, 3, 1);

INSERT INTO tema2.Professor (salary, staffNumber, yearsOfService, numberOfClasses, personID) VALUES
(80000, 456, 3, 2, 2);


-- Inserting into tema2.Address
INSERT INTO tema2.Address (street, city, state, postalCode, country) VALUES
('789 Oak Street', 'Seattle', 'WA', 54321, 'USA');
INSERT INTO tema2.Address (street, city, state, postalCode, country) VALUES
('790 Blk Street', 'London', 'WA', 54321, 'UK');

-- Inserting into tema2.Person
INSERT INTO tema2.Person (id, name, emailAddress, phoneNumber, addressStreet, addressPostcode) VALUES
(3, 'Michael Johnson', 'michael@example.com', '555-123-4567', '789 Oak Street', 54321);

-- Inserting into tema2.Student
INSERT INTO tema2.Student (studentID, studentNumber, averageMark, professorID, staffNumberS, yearsOfServiceS) VALUES
(3, 1003, 78, 1, 123, 5);

-- Inserting into tema2.Professor
INSERT INTO tema2.Professor (salary, staffNumber, yearsOfService, numberOfClasses, personID) VALUES
(90000, 125, 5, 4, 3);

-- Select statements
select salary, staffNumber from tema2.professor where staffNumber > 123;
select studentID, studentNumber from tema2.student where averageMark > 6;
select emailAddress from tema2.person where id >= 2;

-- Update statements
update tema2.professor set staffNumber = 120 where staffNumber = 123;
update tema2.professor set salary = salary + 10000 where yearsOfService >= 5;

-- Delete statements
delete from tema2.professor where salary < 70000; 
delete from tema2.address where country = "UK";

-- Join statements

-- INNER JOIN
select person.name, person.addressStreet
from tema2.person
inner join tema2.address
on addressStreet = street and addressPostcode = postalcode;

-- OUTER JOIN
select professor.salary, student.studentNumber
from tema2.student
left join tema2.professor
on staffNumberS = staffNumber and yearsOfServiceS = yearsOfService;
