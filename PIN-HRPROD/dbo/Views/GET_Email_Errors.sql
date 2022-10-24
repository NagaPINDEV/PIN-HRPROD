
CREATE VIEW [dbo].[GET_Email_Errors]
AS
SELECT FirstName, LastName,Nickame AS KnownAs, DOB, ManagerName, ManagerHRIS, Legalentity, DateRecord, StartDate, Office, Brand, Team, Title, Consultant_Email,Consultant_Name,Vacancy_Title
,
SUBSTRING(Vacancy_Title,CHARINDEX('- ',Vacancy_Title,0)+2,CHARINDEX(' -',Vacancy_Title,CHARINDEX(' - ',Vacancy_Title,0)+1)-5) AS Vacancy_Office, Vacancy_ID,
IIF(Office='Unknown','Red','Black') AS UnkOffice,
IIF(Brand='Unknown','Red','Black') AS UnkBrand,
IIF(Team='Unknown','Red','Black') AS UnkTeam,
IIF(Nickame Is Null,'Red','Black') AS UnkKnownAs,
IIF(DOB ='1900-01-01','Red','Black') AS UnkDOB
	,Personnell_Number,PositionID
FROM
[dbo].[Placement_Transaction] PT
INNER JOIN [dbo].[CFG_EmpNumber] EM on EM.Placement_ID = PT.Placment_Id
WHERE Is_Latest = 1
AND (Office = 'Unknown'
--OR Brand= 'Unknown'  --*Known Error
OR Team = 'Unknown'
OR Nickame IS NULL OR DOB ='1900-01-01')

