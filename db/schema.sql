create database BFSI;

use  BFSI;

CREATE TABLE users(
Username VARCHAR(30),
password VARCHAR (30)
);

INSERT INTO users (Username, Password) VALUES
('SBIN00', 'SBIN@6590');

select * from users;

create table finCorp(branchId int primary key, branchName varchar(30), location varchar(30), NumOftransactions int,dateOfTransaction date) ;

desc finCorp;

insert into finCorp values(1111, "Andheri Branch", "Mumbai", 12, "2025-04-23");
insert into finCorp values(2222, "Jaipur Branch" , "Rajasthan", 8, "2025-03-22" );
insert into finCorp values(3333, "Gautam Buddha Nagar Branch" , "Noida", 8, "2025-01-01" );
insert into finCorp values(4444, "Bellandur Branch" , "Bengaluru", 14, "2025-05-09" );
insert into finCorp values(5555, "Indirapuram Branch " , "Ghaziabad", 20, "2025-04-01" );
insert into finCorp values(6666, "Marathalli Branch " , "Bengaluru", 4, "2025-01-01" );
insert into finCorp values(7777, "Udaipur Branch " , "Rajasthan", 20, "2025-02-21" );
insert into finCorp values(8888, " Vasant Kunj Branch" , "Delhi", 12, "2025-03-08" );
insert into finCorp values(9999, "Railway Road Branch " , "Delhi", 19, "2025-06-23" );
insert into finCorp values(1010, "Tonk Branch" , "Rajasthan", 23, "2025-03-04" );
insert into finCorp values(1100, "Airport Road Branch" , "Chennai", 4, "2025-01-20" );
insert into finCorp values(1200, "Noida Extn. Branch" , "Noida", 6, "2025-08-20" );
insert into finCorp values(1300, "Varthur Branch" , "Bengaluru", 40, "2025-05-05" );
insert into finCorp values(1400, "Mall Road Branch" , "Manali", 13, "2025-06-22" );
insert into finCorp values(1500, "Kharadi Branch" , "Pune", 23, "2025-04-14" );
insert into finCorp values(1600, "Dwarka Branch" , "Delhi", 24, "2025-09-22" );

select * from finCorp;

