
-------------- Phần 1: Tạo bảng -----------
USE [master]

CREATE TABLE [dbo].[Breed_DIM](
	[Breed_ID] [int] IDENTITY(1,1) NOT NULL primary key,
	[Breed_Name] [varchar](255) NULL);

CREATE TABLE [dbo].[Color_DIM](
	[Color_ID] [int] IDENTITY(1,1) NOT NULL primary key,
	[Color_Name] [varchar](255) NULL);

CREATE TABLE [dbo].[FurLength_DIM](
	[FurLength_ID] [int] IDENTITY(1,1) NOT NULL primary key,
	[FurLength] [varchar](13) NULL); 

CREATE TABLE [dbo].[MaturitySize_DIM](
	[MaturitySize_ID] [int] IDENTITY(1,1) NOT NULL primary key,
	[Marturity_Size] [varchar](13) NULL);

CREATE TABLE [dbo].[Pet_Health_DIM](
	[Health_ID] [int] IDENTITY(1,1) NOT NULL primary key,
	[Vaccinated] [varchar](8) NULL,
	[Dewormed] [varchar](8) NULL,
	[Sterilized] [varchar](8) NULL,
	[Health] [varchar](14) NULL);

CREATE TABLE [dbo].[PetType_DIM](
	[TypeID] [int] IDENTITY(1,1) NOT NULL primary key,
	[TypeName] [varchar](3) NULL);

CREATE TABLE [dbo].[State_DIM](
	[State_ID] [int] IDENTITY(1,1) NOT NULL primary key,
	[State_Name] [varchar](255) NULL);

DELETE from Pet_Fact_Revision

CREATE TABLE [dbo].[Pet_Fact_Revision](
	[Pet_ID] [int] NOT NULL primary key,
	[Type_ID] [int] NULL,
	[Breed1_ID] [int] NULL,
	[Breed2_ID] [int] NULL,
	[Gender] [varchar](6) NULL,
	[Color1_ID] [int] NULL,
	[Color2_ID] [int] NULL,
	[Color3_ID] [int] NULL,
	[MartuirtySize_ID] [int] NULL,
	[FurLength_ID] [int] NULL,
	[Health_ID] [int] NULL,
	[State_ID] [int] NULL,
	[Age] [int] NULL,
	[Quantity] [int] NULL,
	[Fee] [int] NULL,
	[RescuerID] [int] NULL);

------ Phần 2: Chạy truy vấn -----------
------1.	Có bao nhiêu con mèo trên 3 tháng tuổi mà có lông dài ----
SELECT 
count(Pet_ID) as number_of_long_fur_cat
From Pet_Fact_Revision
where Type_ID = 
              (SELECT typeID from PetType_DIM 
               where typeName='cat')
And age>=3
AND FurLength_ID = 
                   (SELECT FurLength_ID from FurLength_DIM
                    Where furlength ='long');

-----------2.	Top 5 tiểu bang có số lượng vật nuôi nhiều nhất ---
SELECT top 5 pfr.state_ID, sd.State_Name, count(Pet_ID) as Number_Of_Animal
from Pet_Fact_Revision as pfr
Left join State_DIM as sd
On sd.State_ID=pfr.State_ID
Group by pfr.state_ID, sd.State_Name
order by count(Pet_ID) desc;

------------3.	Số lượng vật nuôi phân theo loài vật nuôi---------
SELECT 
pfr.type_ID,pd.typeName,
count(pet_ID) as number_of_animals
From Pet_Fact_Revision as pfr
Left join pettype_DIM as pd
on pd.TypeID=pfr.Type_ID
Group by pfr.type_ID, pd.TypeName;


--------- 4.4.	Có bao nhiêu con vật trên 1 tháng tuổi mà đạt yêu cầu về sức khỏe 
-----(Đã được tiêm chủng, đã được tẩy giun, đã được khử trùng và đang khỏe mạnh)

SELECT count(pet_ID)as Number_of_healthy_morethan1monthold_animals
From Pet_Fact_Revision
Where Health_ID =
   (SELECt Health_ID from Pet_Health_DIM
   Where Vaccinated = 'yes' AND Dewormed='yes' and Sterilized='yes' and Health='healthy')
AND Age>=1;



















