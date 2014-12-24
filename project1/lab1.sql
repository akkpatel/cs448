rem CS 448 SQLPLUS Project1
rem Anand Patel


CREATE TABLE Guides(
	GuidId integer NOT NULL,
	FirstName VARCHAR(25),
	LastName VARCHAR(25),
	Age integer,
	NumCapacity integer,
	PRIMARY KEY (GuidId)
);


CREATE TABLE GLangs(
	GuidId integer NOT NULL,
	Language VARCHAR(25) NOT NULL,
	PRIMARY KEY (GuidId, Language),
	CONSTRAINT fk_gid FOREIGN KEY (GuidId) REFERENCES Guides(GuidId)
);

CREATE TABLE Groups(
	GroupId integer NOT NULL,
	Country VARCHAR(25),
	PRIMARY KEY (GroupId)
);


CREATE TABLE Visitors(
	VisitorId integer NOT NULL,
	GroupId integer,
	FirstName VARCHAR(25),
	LastName VARCHAR(25),
	Age integer,
	PRIMARY KEY (VisitorId)
);

CREATE TABLE VLangs(
	VisitorId integer NOT NULL,
	Language VARCHAR(25) NOT NULL,
	PRIMARY KEY (VisitorId, Language),
	CONSTRAINT fk_vis FOREIGN KEY (VisitorId) references Visitors(VisitorId)	
);

CREATE TABLE Routes(
	GuidId integer NOT NULL,
	GroupId integer NOT NULL,
	FromDate DATE NOT NULL,
	ToDate DATE NOT NULL,
	PRIMARY KEY (GuidId, GroupId, FromDate, ToDate),
	CONSTRAINT fk_gid2 FOREIGN KEY (GuidId) REFERENCES Guides(GuidId),
	CONSTRAINT fk_grp2 FOREIGN KEY (GroupId) REFERENCES Groups(GroupId)
);

CREATE TABLE Foods(
	FoodID integer NOT NULL,
	GroupID integer,
	Name VARCHAR(25),
	PRIMARY KEY (FoodID),
	CONSTRAINT fk_grp3 FOREIGN KEY (GroupId) REFERENCES Groups(GroupId)
);

-- Insert Data into Guides
INSERT INTO Guides VALUES (1, 'Ruby', 'Elmagarmind', 25, 5);
INSERT INTO Guides VALUES (2, 'Walid', 'Aref', 27, 13);
INSERT INTO Guides VALUES (3, 'Christopher', 'Clifton', 18, 4);
INSERT INTO Guides VALUES (4, 'Sunil', 'Prabhakar', 22, 7);
INSERT INTO Guides VALUES (5, 'Elisa', 'Bertino', 26, 5);
INSERT INTO Guides VALUES (6, 'Dong', 'Su', 23, 3);
INSERT INTO Guides VALUES (7, 'David', 'Eberts', 24, 8);
INSERT INTO Guides VALUES (8, 'Arif', 'Ghafoor', 20, 5);
INSERT INTO Guides VALUES (9, 'Eduard', 'C Dragut' , 19, 10);

-- Insert Data into GLangs

INSERT INTO GLangs VALUES (1, 'Arabic');
INSERT INTO GLangs VALUES (1, 'English');
INSERT INTO GLangs VALUES (2, 'Arabic');
INSERT INTO GLangs VALUES (2, 'English');
INSERT INTO GLangs VALUES (3, 'Arabic');
INSERT INTO GLangs VALUES (3, 'English');
INSERT INTO GLangs VALUES (4, 'English');
INSERT INTO GLangs VALUES (4, 'Japanese');
INSERT INTO GLangs VALUES (4, 'Russian');
INSERT INTO GLangs VALUES (5, 'Spanish');
INSERT INTO GLangs VALUES (5, 'English');
INSERT INTO GLangs VALUES (6, 'French');
INSERT INTO GLangs VALUES (7, 'Japanese');
INSERT INTO GLangs VALUES (7, 'Italian');
INSERT INTO GLangs VALUES (8, 'Portuguese');
INSERT INTO GLangs VALUES (9, 'Spanish');
INSERT INTO GLangs VALUES (9, 'English');


-- Insert Data into Visitors

INSERT INTO Visitors VALUES (1, 3, 'Yi-Cheng', 'Tu', 52);
INSERT INTO Visitors VALUES (2, 4, 'Hazem', 'Elmeleegy', 35);
INSERT INTO Visitors VALUES (3, 6, 'Yuni', 'Xia', 65);
INSERT INTO Visitors VALUES (4, 7, 'Hicham', 'Elmongui', 40);
INSERT INTO Visitors VALUES (5, 5, 'Mohamed', 'Ali', 66);
INSERT INTO Visitors VALUES (6, 4, 'Chris', 'Mayfield', 74);
INSERT INTO Visitors VALUES (7, 4, 'Xiaopeng', 'Xiong', 45);
INSERT INTO Visitors VALUES (8, 3, 'Ilya', 'Figotin', 62);
INSERT INTO Visitors VALUES (9, 1, 'Sarvjeet', 'Singh', 57);
INSERT INTO Visitors VALUES (10, 2,'Mehmet', 'Nergiz', 49);
INSERT INTO Visitors VALUES (11, 4,'Wei', 'Jiang', 38);
INSERT INTO Visitors VALUES (12, 3, 'Thanaa', 'Ghanem', 52);
INSERT INTO Visitors VALUES (13, 2, 'Murat', 'Kantarcioglu', 64);
INSERT INTO Visitors VALUES (14, 6, 'Mohamed', 'Mokbel', 55);
INSERT INTO Visitors VALUES (15, 7, 'Mohamed', 'Shehab', 43);
INSERT INTO Visitors VALUES (16, 1, 'Mohamed', 'Eltbakh', 70);
INSERT INTO Visitors VALUES (17, 7, 'Daisuke', 'Tkihara', 30);
INSERT INTO Visitors VALUES (18, 4, 'Ming', 'Tang', 30);


-- Insert Data into Groups

INSERT INTO Groups VALUES (1, 'Germany');
INSERT INTO Groups VALUES (2, 'England');
INSERT INTO Groups VALUES (3, 'USA');
INSERT INTO Groups VALUES (4, 'China');
INSERT INTO Groups VALUES (5, 'Brazil');
INSERT INTO Groups VALUES (6, 'India');
INSERT INTO Groups VALUES (7, 'Japan');


-- Insert Data into VLangs

INSERT INTO VLangs VALUES (1, 'Arabic');
INSERT INTO VLangs VALUES (1, 'Japanese');
INSERT INTO VLangs VALUES (2, 'Italian');
INSERT INTO VLangs VALUES (3, 'English');
INSERT INTO VLangs VALUES (3, 'Chinese');
INSERT INTO VLangs VALUES (3, 'French');
INSERT INTO VLangs VALUES (4, 'Arabic');
INSERT INTO VLangs VALUES (5, 'English');
INSERT INTO VLangs VALUES (6, 'Japanese');
INSERT INTO VLangs VALUES (6, 'Italian');
INSERT INTO VLangs VALUES (7, 'Portuguese');
INSERT INTO VLangs VALUES (7, 'Spanish');
INSERT INTO VLangs VALUES (8, 'Spanish');
INSERT INTO VLangs VALUES (8, 'English');
INSERT INTO VLangs VALUES (9, 'Japanese');
INSERT INTO VLangs VALUES (10,'Russian');
INSERT INTO VLangs VALUES (10, 'English');
INSERT INTO VLangs VALUES (11, 'Spanish');
INSERT INTO VLangs VALUES (12, 'German');
INSERT INTO VLangs VALUES (12, 'English');
INSERT INTO VLangs VALUES (13, 'English');
INSERT INTO VLangs VALUES (14, 'French');
INSERT INTO VLangs VALUES (14, 'Russian');
INSERT INTO VLangs VALUES (15, 'Spanish');
INSERT INTO VLangs VALUES (16, 'English');
INSERT INTO VLangs VALUES (17, 'Japanese');
INSERT INTO VLangs VALUES (17, 'English');
INSERT INTO VLangs VALUES (18, 'Chinese');

-- Change Date Settings to the field given in the table
ALTER session set nls_date_format='mm/dd/rrrr';


-- Insert Data into Routes

INSERT INTO Routes VALUES (3, 5, '2/10/2013', '2/13/2013');
INSERT INTO Routes VALUES (1, 2, '2/12/2013', '2/14/2013');
INSERT INTO Routes VALUES (9, 1, '2/15/2013', '2/15/2013');
INSERT INTO Routes VALUES (5, 7, '2/14/2013', '2/18/2013');
INSERT INTO Routes VALUES (1, 3, '2/15/2013', '2/16/2013');
INSERT INTO Routes VALUES (2, 6, '2/17/2013', '2/20/2013');
INSERT INTO Routes VALUES (3, 4, '2/18/2013', '2/19/2013');
INSERT INTO Routes VALUES (4, 1, '2/19/2013', '2/19/2013');
INSERT INTO Routes VALUES (2, 7, '2/18/2013', '2/23/2013');
INSERT INTO Routes VALUES (8, 5, '2/20/2013', '2/22/2013');
INSERT INTO Routes VALUES (3, 2, '2/24/2013', '2/26/2013');
INSERT INTO Routes VALUES (6, 6, '2/25/2013', '2/26/2013');



-- Insert Data into Foods
INSERT INTO Foods VALUES (1, 1, 'Sandwich');
INSERT INTO Foods VALUES (2, 1, 'Hot dog');
INSERT INTO Foods VALUES (3, 2, 'Hamburger');
INSERT INTO Foods VALUES (4, 2, 'Sandwich');
INSERT INTO Foods VALUES (5, 3, 'Baconator');
INSERT INTO Foods VALUES (6, 3, 'Chicken Nuggets');
INSERT INTO Foods VALUES (7, 3, 'Spicy Chicken Sandwich');
INSERT INTO Foods VALUES (8, 4, 'Noodles');
INSERT INTO Foods VALUES (9, 4, 'Fried Rice');
INSERT INTO Foods VALUES (10,5 , 'Feijoada');
INSERT INTO Foods VALUES (11, 5, 'Acaraje');
INSERT INTO Foods VALUES (12, 6, 'Biryani');
INSERT INTO Foods VALUES (13, 6,  'Pav Bhaji');
INSERT INTO Foods VALUES (14, 7, 'Sushi');

-- Finished Inserting Data for all the table created.

-- Part 2 Question 1

SELECT FirstName, LastName, Age FROM Visitors WHERE Age > 65 or Age < 45;

-- Part 2 Question 2

SELECT Guides.FirstName, Guides.LastName
FROM Guides, Routes
WHERE '2/23/2013' >= Routes.FromDate AND '2/23/2013' <= Routes.ToDate AND Guides.GuidId = Routes.GuidId;

-- Part 2 Question 3

CREATE VIEW new_guide AS
SELECT GuidId, COUNT(GuidId) AS NumOfRoutes
FROM Routes
Group By GuidId;

Select Guides.FirstName, Guides.LastName, new_guide.GuidId, new_guide.NumOfRoutes
From new_guide, Guides
Where new_guide.GuidId = Guides.GuidId
ORDER BY Guides.FirstName;

DROP VIEW new_guide;


-- Part 2 Question 4

CREATE VIEW ant_group AS
SELECT GroupId, COUNT(GroupId) AS NumOfVis
FROM Visitors
Group BY GroupId;

Select Routes.GuidId, Routes.GroupId, Routes.FromDate, Routes.ToDate, ant_group.NumOfVis
From Routes, ant_group
Where ant_group.NumOfVis > 3 AND ant_group.GroupId = Routes.GroupId;


-- Part 2 Question 5

SELECT DISTINCT Routes.GuidId, Routes.GroupId, Routes.FromDate, Routes.ToDate
FROM Routes, Guides
WHERE (SELECT AVG(Age) FROM Visitors) > 3*Guides.Age AND Routes.GuidId = Guides.GuidId;


-- part 2 Question 6

Create view comm AS
Select Routes.GuidId, SUM(ant_group.NumOfVis) AS NumOfVis
FROM Routes, ant_group
Where Routes.GroupId = ant_group.GroupId
Group BY Routes.GuidId;

SELECT comm.GuidId, comm.NumofVis, Guides.FirstName, Guides.LastName
FROM comm, Guides
Where comm.NumOfVis > 9 AND comm.GuidId = Guides.GuidId;



-- part 2 Question 7

SELECT DISTINCT x.FromDate, x.ToDate, x.GuidId
FROM Routes x, Routes y
WHERE x.GuidId = Y.GuidId AND x.FromDate > y.FromDate AND x.FromDate <= y.ToDate 
OR x.ToDate >= y.FromDate AND x.ToDate < y.ToDate AND x.GuidId = y.GuidId;


-- Part 2 Question 8

select language, count(Language) AS NumOfPeople
FROM VLangs
Group by Language
Order by NumOfPeople DESC;

-- Part 2 Question 9
Select Visitors.LastName, Visitors.FirstName, Foods.name
From Visitors, Foods
Where Visitors.GroupId = Foods.GroupId
Order by Visitors.LastName;


-- Part 3 Question 1 Updates
UPDATE Guides
SET NumCapacity = 10
Where GuidId = 2;


-- Part 3 Question 2 Updates

UPDATE Visitors
SET Age = (Age+3)
Where exists ( Select Language FROM VLangs Where Vlangs.Language = 'English' AND VLangs.VisitorId = Visitors.VisitorId)
;


-- Part 3 Question 3 Updates


Delete FROM Routes
WHERE EXISTS ( SELECT Groups.Country FROM Groups
Where Groups.GroupId = Routes.GroupId AND Groups.Country = 'England');


-- Part 3 Question 4 Updates
INSERT INTO Foods VALUES (15, 7, 'Noodles');
UPDATE Foods
set Name = 'French Fries'
WHERE EXISTS ( SELECT Groups.Country FROM Groups
Where Groups.GroupId = Foods.GroupId AND Groups.Country = 'USA' AND Foods.name = 'Baconator');



-- Part 3 Question 5 Updates



DROP VIEW ant_group;
DROP VIEW comm;
DROP TABLE Guides CASCADE CONSTRAINTS;
DROP TABLE GLangs CASCADE CONSTRAINTS;
DROP TABLE Groups CASCADE CONSTRAINTS;
DROP TABLE Visitors CASCADE CONSTRAINTS;
DROP TABLE VLangs CASCADE CONSTRAINTS;
DROP TABLE Routes CASCADE CONSTRAINTS;
DROP TABLE Foods CASCADE CONSTRAINTS;




