DROP TABLE SCHEDULE;

CREATE TABLE SCHEDULE(
 Course_Id int not null PRIMARY KEY,
 Room_No varchar(50),
 Time_Start timestamp,
 Time_End timestamp
 );
