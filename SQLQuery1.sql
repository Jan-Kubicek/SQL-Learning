/* tabulka názvem knihy a atributy ISBN,Nazev,RokVydani, PocetVytisku,Poznamka => urèení not null resp. null */
CREATE TABLE Knihy(
ISBN varchar(20) not null,
Nazev varchar(50) not null,
RokVydani int not null,
PocetVytisku int not null,
Poznamka varchar(100));
ALTER TABLE Knihy
ADD CONSTRAINT pk_knihy PRIMARY KEY(ISBN);
/* Pøidá primární klíè tabulce Knihy ( tabulku upravujeme ) */
CREATE TABLE Autori(
ID_Autor int CONSTRAINT pk_Autor PRIMARY KEY,
Jmeno varchar(20) not null,
Prijmeni varchar(30) not null,
Komentar varchar(100));
/* Vytvoøí tabulku autor pøímo s primárním klíèem => pk_XXXX je automaticky not null a unique */
ALTER TABLE Knihy
ADD ID_Autor int not null;
/* vytvoøí atribut v autor s int tabulce knihy */
ALTER TABLE Knihy
ADD CONSTRAINT fk_autori_knihy FOREIGN KEY (ID_Autor)
REFERENCES Autori(ID_Autor);
/* vytvoøí foreinkey */
INSERT INTO Autori VALUES
(1, 'Vladimir','Nabokov', 'Svìtová literatura 20. století');
-- pouze vkládám li vše co tabulka požaduje
INSERT INTO Autori (ID_Autor,Jmeno,Prijmeni)
VALUES(2, 'Karel','Èapek');
-- mùžeme vkládat i omezená data ( vstup )
INSERT INTO Autori VALUES
(20,'Karel','Èapek','');
--  mùžeme vkládat i takto 
INSERT INTO Knihy (ISBN,Nazev,RokVydani,PocetVytisku,Poznamka,ID_Autor) VALUES
( '80-56216-46-2','R.U.R',2004,6,'',2),
( '80-7185-784-6','Lolita',2007,3,'',1),
('80-86201-39-2','Válka s mloky',2007,5,'',2);
-- lze vkládat po jedné ale mùžeme i násobnì
SELECT * FROM Knihy;
SELECT * FROM Autori;
-- kontrola dat v pøíslušných tabulkách 
UPDATE Autori
SET Komentar ='Významný èeský autor'
WHERE ID_Autor =2;
-- v tabulce autori nastaví komentáø pro ID_AUTOR = 2;
ALTER TABLE Knihy
DROP COLUMN Poznamka;
-- V Tabulce knihy odstrñte sloupec poznamka
UPDATE Knihy
SET PocetVytisku = PocetVytisku + 2
WHERE ID_Autor = 2;
--  zvýšení poètu výtiskù o 2 u všech knih, které prodal autor ID_Autor = 2

-- cviko07
select name, GroupName
from AdventureWorks22.HumanResources.Department;

select * from AdventureWorks22.Production.Product

select BusinessEntityID, BirthDate DatumNarozeni, JobTitle PracovniPozice, Gender Pohlavi from AdventureWorks22.HumanResources.Employee;
-- datumNarozeni lze psát i takto "Datum Narozeni" => více slovné názvy pouze s uvozovkami ""

select Name Nazev, ProductNumber "Cislo produktu", ListPrice Cena, Size 
from AdventureWorks22.Production.Product;


-- vyhledání poètu záznamù 
select count (BusinessEntityID) AS Pocet
From AdventureWorks22.HumanResources.Employee;

select count(*) Pocet From AdventureWorks22.HumanResources.Employee;

-- seskupí dle productmodelid + vypoèítáme èetnost + vypoèítá pro nì avg cenu
Select ProductModelID, Count(ProductID) AS Pocet,
AVG(StandardCost) AS Prumerna_cena
From AdventureWorks22.Production.Product
Group by ProductModelID;
-- 1. select 2. seskupení 3. poté agregaèní dotazy Count, AVG

select distinct ProductModelID From AdventureWorks22.Production.Product;
-- ovìøení kolik øádkù mám mít

select ProductModelID From AdventureWorks22.Production.Product
ORDER by 1 desc;
/*
	agregaèní funkce Count,avg, mají na vstupu n hodnot a vracejí právì jednu
*/