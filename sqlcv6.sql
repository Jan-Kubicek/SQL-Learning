CREATE TABLE Skupina (
	Nazev varchar(50) not null,
	Majitel varchar(20) not null,
	Popis varchar(35) not null,
	Ulice varchar(45) not null,
	Mesto varchar(30) not null,
	Id int not null,
)
DROP TABLE Skupina
ALTER TABLE Skupina ADD CONSTRAINT PK_student PRIMARY KEY (Id)

CREATE TABLE Member(
	ID int not null,
	Jmeno varchar(10) not null,
	Prijmeni varchar(25) not null,
	Zisk int null,
	RodneCislo char(10) null,
)
ALTER TABLE Member ADD FK_SkupinaID int not null;

ALTER TABLE Member ADD CONSTRAINT FK_Member_Skupina FOREIGN KEY (FK_SkupinaID) REFERENCES Skupina (Id);

INSERT INTO Skupina VALUES
	('Akatsuki','Obito', 'Listová zmizí z mapy', 'Hradecká 11','Hradec',1),
	('Anteiku','Touka','Lidi nejsou jen jídlo', 'Valašská','Hradec',2);

SELECT * FROM Skupina

INSERT INTO Member VALUES
	(11,'Nuimi','Vondra',10000,'9700002592',2),
	(10,'Ichigo','Kurosaky',10000,'',2),
	(9,'Sasuke','Uchiha',1,'',1),
	(8,'Naruto','Uzumaky',25845,'',1),
	(7,'Sakura','Haruno',578,'98005065',1),
	(6,'Kakashi','Hatake',114477,'',1),
	(5,'Ken','Kaneki',99999999,'85634525',2);

SELECT * FROM Member

SELECT * FROM Member, Skupina WHERE Member.FK_SkupinaID =  Skupina.Id;
-- vypíše èleny se skupinami ke kterým patøí

SELECT * FROM Member WHERE Member.FK_SkupinaID = 2

SELECT * FROM Member WHERE Member.Zisk < 50 OR Member.Zisk IS NULL

SELECT AVG(Zisk) COUNT (FK_SkupinaID) FROM Member WHERE FK_SkupinaID = 2

SELECT Member.Jmeno FROM Member WHERE Member.Zisk < 9999 AND Member.Zisk > 50

DROP TABLE Member
DROP TABLE Skupina