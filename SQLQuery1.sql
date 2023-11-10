/* tabulka n�zvem knihy a atributy ISBN,Nazev,RokVydani, PocetVytisku,Poznamka => ur�en� not null resp. null */
CREATE TABLE Knihy(
ISBN varchar(20) not null,
Nazev varchar(50) not null,
RokVydani int not null,
PocetVytisku int not null,
Poznamka varchar(100));
ALTER TABLE Knihy
ADD CONSTRAINT pk_knihy PRIMARY KEY(ISBN);
/* P�id� prim�rn� kl�� tabulce Knihy ( tabulku upravujeme ) */
CREATE TABLE Autori(
ID_Autor int CONSTRAINT pk_Autor PRIMARY KEY,
Jmeno varchar(20) not null,
Prijmeni varchar(30) not null,
Komentar varchar(100));
/* Vytvo�� tabulku autor p��mo s prim�rn�m kl��em => pk_XXXX je automaticky not null a unique */
ALTER TABLE Knihy
ADD ID_Autor int not null;
/* vytvo�� atribut v autor s int tabulce knihy */
ALTER TABLE Knihy
ADD CONSTRAINT fk_autori_knihy FOREIGN KEY (ID_Autor)
REFERENCES Autori(ID_Autor);
/* vytvo�� foreinkey */
INSERT INTO Autori VALUES
(1, 'Vladimir','Nabokov', 'Sv�tov� literatura 20. stolet�');
-- pouze vkl�d�m li v�e co tabulka po�aduje
INSERT INTO Autori (ID_Autor,Jmeno,Prijmeni)
VALUES(2, 'Karel','�apek');
-- m��eme vkl�dat i omezen� data ( vstup )
INSERT INTO Autori VALUES
(20,'Karel','�apek','');
--  m��eme vkl�dat i takto 
INSERT INTO Knihy (ISBN,Nazev,RokVydani,PocetVytisku,Poznamka,ID_Autor) VALUES
( '80-56216-46-2','R.U.R',2004,6,'',2),
( '80-7185-784-6','Lolita',2007,3,'',1),
('80-86201-39-2','V�lka s mloky',2007,5,'',2);
-- lze vkl�dat po jedn� ale m��eme i n�sobn�
SELECT * FROM Knihy;
SELECT * FROM Autori;
-- kontrola dat v p��slu�n�ch tabulk�ch 
UPDATE Autori
SET Komentar ='V�znamn� �esk� autor'
WHERE ID_Autor =2;
-- v tabulce autori nastav� koment�� pro ID_AUTOR = 2;
ALTER TABLE Knihy
DROP COLUMN Poznamka;
-- V Tabulce knihy odstr�te sloupec poznamka
UPDATE Knihy
SET PocetVytisku = PocetVytisku + 2
WHERE ID_Autor = 2;
--  zv��en� po�tu v�tisk� o 2 u v�ech knih, kter� prodal autor ID_Autor = 2

-- cviko07
select name, GroupName
from AdventureWorks22.HumanResources.Department;

select * from AdventureWorks22.Production.Product

select BusinessEntityID, BirthDate DatumNarozeni, JobTitle PracovniPozice, Gender Pohlavi from AdventureWorks22.HumanResources.Employee;
-- datumNarozeni lze ps�t i takto "Datum Narozeni" => v�ce slovn� n�zvy pouze s uvozovkami ""

select Name Nazev, ProductNumber "Cislo produktu", ListPrice Cena, Size 
from AdventureWorks22.Production.Product;


-- vyhled�n� po�tu z�znam� 
select count (BusinessEntityID) AS Pocet
From AdventureWorks22.HumanResources.Employee;

select count(*) Pocet From AdventureWorks22.HumanResources.Employee;

-- seskup� dle productmodelid + vypo��t�me �etnost + vypo��t� pro n� avg cenu
Select ProductModelID, Count(ProductID) AS Pocet,
AVG(StandardCost) AS Prumerna_cena
From AdventureWorks22.Production.Product
Group by ProductModelID;
-- 1. select 2. seskupen� 3. pot� agrega�n� dotazy Count, AVG

select distinct ProductModelID From AdventureWorks22.Production.Product;
-- ov��en� kolik ��dk� m�m m�t

select ProductModelID From AdventureWorks22.Production.Product
ORDER by 1 desc;
/*
	agrega�n� funkce Count,avg, maj� na vstupu n hodnot a vracej� pr�v� jednu
*/