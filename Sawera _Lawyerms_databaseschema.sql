use lawyerms;
create table Lawyers(
LawyerId int primary key auto_increment,
Name varchar(50),
Address varchar(50),
Phone varchar(20),
Email varchar(50)
);
create table Cases(
CaseId int primary key auto_increment,
CaseName varchar(50),
Description text,
Status varchar(50)
);

create table Clients(
ClientId int primary key auto_increment,
Name varchar(50),
Address varchar(50),
Phone varchar(20),
Email varchar(50)
);

create table Case_Lawyers(
CaseId int,
LawyerId int,
primary key(CaseId, LawyerId),
foreign key(CaseId) references Cases(CaseId),
foreign key(LawyerId) references Lawyers(LawyerId)
);

create table Case_Clients(
CaseId int,
ClientId int,
primary key(CaseId, ClientId),
foreign key(CaseId) references Cases(CaseId),
foreign key(ClientId) references Clients(ClientId)
);

create table Courts(
CourtId int primary key,
CourtName varchar(50),
Location varchar(50)
);

select * from Lawyers;
select * from Cases;
select * from Clients;
select * from Case_Lawyers;
select * from Case_Clients;
select * from Courts;
select * from Hearings;
select * from Bills;
select * from Payments;
select * from feedback;

insert into Lawyers(Name,Address,Phone,Email) values('sawera','Clifton_Karachi','03214456776','sawi00@gmail.com');

insert into Cases(CaseName,Description,Status)values('Divorce_case','This case will be conducted by our cheif lawyer Ali Khan, its about divorce case','Active');
insert into Clients(Name,Address,Phone,Email) values('meshal','Karachi','03008347567','mishi@gmail.com');

INSERT INTO Case_Lawyers (CaseId, LawyerId) VALUES (
  (SELECT CaseId FROM Cases WHERE CaseName = 'Divorce_case'),
  (SELECT LawyerId FROM Lawyers WHERE Name = 'sawera')
);

INSERT INTO Case_Clients (CaseId, ClientId) VALUES (
  (SELECT CaseId FROM Cases WHERE CaseName = 'Divorce_case'),
  (SELECT ClientId FROM Clients WHERE Name = 'meshal')
);

insert into Courts(CourtId,CourtName,Location) values(1,'HighCourt','Karachi');

create table Hearings(
HearingId int primary key auto_increment,
CaseId int,
CourtId int,
Date date,
Time Time,
Foreign key(CaseId) references Cases(CaseId),
Foreign key(CourtId) references Courts(CourtId)
);

create table Bills(
BillId int primary key auto_increment,
CaseId int,
Amount int,
Date Date,
Foreign key(CaseId) references Cases(CaseId)
);

create table Payments(
PaymentId int primary key auto_increment,
BillId int,
Amount int,
Date Date,
Foreign key(BillId) references Bills(BillId)
);

create table feedback(
FeedbackId int primary key auto_increment,
Name varchar(50),
Email varchar(50),
Message Text
);

INSERT INTO Hearings (CaseId, CourtId, Date, Time) VALUES (1, 1, '2024-05-10', '10:00:00');
INSERT INTO Bills (CaseId, Amount, Date) VALUES (1, 500, '2024-05-10');
INSERT INTO Payments (BillId, Amount, Date) VALUES (1, 500, '2024-05-10');
INSERT INTO feedback (Name, Email, Message) VALUES ('Hadiya Khan', 'hadiya@example.com', 'Great service!');


