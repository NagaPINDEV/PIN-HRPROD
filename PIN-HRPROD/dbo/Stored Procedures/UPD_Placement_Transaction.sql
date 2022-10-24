
CREATE PROCEDURE UPD_Placement_Transaction
(
@Placment_Id NVARCHAR(256),
@Vacancy_ID  NVARCHAR(256),
@Consultant_ID  NVARCHAR(256),
@Candidate_ID  NVARCHAR(256),
@Manager_Contact_ID  NVARCHAR(256),
@FirstName  NVARCHAR(256),
@LastName  NVARCHAR(256),
@Nickame  NVARCHAR(256),
@PersonalEmail  NVARCHAR(256), 
@PersonalMobile  NVARCHAR(256),
@StartDate date,
@ClientName  NVARCHAR(256),
@ClientGuid  NVARCHAR(256),
@DOB  NVARCHAR(256),
@Office  NVARCHAR(256),
@Brand  NVARCHAR(256),
@Team  NVARCHAR(256),
@ManagerHRIS  NVARCHAR(256),
@ManagerName  NVARCHAR(256),
@Title  NVARCHAR(256),
@Vac_Title  NVARCHAR(256),
@Cons_Email  NVARCHAR(256),
@ConsName  NVARCHAR(256),  
@Salary  NVARCHAR(256),
@Address1  NVARCHAR(256),
@Address2  NVARCHAR(256),
@Address3  NVARCHAR(256),
@Town_City  NVARCHAR(256),
@County  NVARCHAR(256),
@Postcode  NVARCHAR(256),
@Country  NVARCHAR(256),
@Pers_Email  NVARCHAR(256), 
@Pers_Mobile  NVARCHAR(256),
@SharepointDocs NVARCHAR(256)
)

AS
BEGIN

UPDATE  [dbo].[Placement_Transaction]
SET Is_Latest = 0
WHERE Placment_Id = @Placment_Id



INSERT INTO [dbo].[Placement_Transaction]
           ([Placment_Id]
           ,[Vacancy_ID]
           ,[Consultant_ID]
           ,[Candidate_ID]
           ,[Manager_Contact_ID]
           ,[FirstName]
           ,[LastName]
           ,[Nickame]
           ,[PersonalEmail]
           ,[PersonalMobile]
           ,[StartDate]
           ,[EndDate]
           ,[ClientName]
           ,[ClientGuid]
           ,[DOB]
           ,[HRClientGUID]
           ,[HRCompRegion]
           ,[Office]
           ,[Brand]
           ,[Team]
           ,[HKEY]
           ,[Is_Latest]
           ,[DateRecord]
           ,[SharepointLocation]
           ,[Legalentity]
           ,[ManagerHRIS]
           ,[ManagerName]
           ,[Title]
           ,[Vacancy_Title]
           ,[Consultant_Email]
           ,[Consultant_Name]
           ,[Salary]
           ,[Address1]
           ,[Address2]
           ,[Address3]
           ,[Town_City]
           ,[County]
           ,[Postcode]
           ,[Country]
           ,[Pers_Email]
           ,[Pers_Mobile])
     VALUES
        ( @Placment_Id,
          @Vacancy_ID,
          @Consultant_ID,
          @Candidate_ID,
          @Manager_Contact_ID,
          @FirstName,
          @LastName,
          @Nickame,
          @PersonalEmail, 
          @PersonalMobile,
          @StartDate,
          NULL,
          @ClientName,
          @ClientGuid,
          @DOB,
          NULL,
          NULL,
          @Office,
          @Brand,
          @Team,
          NULL,
          1,
          GETDATE(),
          'SharepointLocation',
          'Legal Entity',
          @ManagerHRIS,
          @ManagerName,
          @Title,
          @Vac_Title,
          @Cons_Email,
          @ConsName, 
          @Salary,
          @Address1,
          @Address2,
          @Address3,
          @Town_City,
          @County,
          @Postcode,
          @Country,
          @Pers_Email, 
          @Pers_Mobile)

END