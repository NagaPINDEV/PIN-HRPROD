CREATE PROCEDURE [dbo].[Send_Email]
(@Placment_ID nvarchar(256))
AS
TRUNCATE TABLE Email_Items 
INSERT INTO Email_Items
SELECT TOP 1 FirstName, LastName,Nickame AS KnownAs, DOB, ManagerName, ManagerHRIS, Legalentity, DateRecord, StartDate, Office, Brand, Team, Title, Consultant_Email,Consultant_Name,Vacancy_Title,Personnell_Number,PositionID
,
SUBSTRING(Vacancy_Title,CHARINDEX('- ',Vacancy_Title,0)+2,CHARINDEX(' -',Vacancy_Title,CHARINDEX(' - ',Vacancy_Title,0)+1)-5) AS Vacancy_Office, Vacancy_ID,
IIF(Office='Unknown','Red','Black') AS UnkOffice,
IIF(Brand='Unknown','Red','Black') AS UnkBrand,
IIF(Team='Unknown','Red','Black') AS UnkTeam,
IIF(Nickame Is Null,'Red','Black') AS UnkKnownAs,
IIF(DOB ='1900-01-01','Red','Black') AS UnkDOB,
Salary,
IIF( Address1 ='Sys_Blank','',	  Address1 	  )
,IIF( Address2	  ='Sys_Blank','',   Address2	  )
,IIF( Address3	  ='Sys_Blank','',   Address3	  )
,IIF( Town_City	  ='Sys_Blank','',   Town_City	  )
,IIF( County		  ='Sys_Blank','',   County		)
,IIF( Postcode	  ='Sys_Blank','',   Postcode	  )
,IIF( Country	  ='Sys_Blank','',   Country	  )
, Pers_Email
, Pers_Mobile
FROM
[dbo].[Placement_Transaction] PT
INNER JOIN [dbo].[CFG_EmpNumber] EM on EM.Placement_ID = PT.Placment_Id
WHERE Is_Latest = 1
AND Placment_Id = @Placment_ID
