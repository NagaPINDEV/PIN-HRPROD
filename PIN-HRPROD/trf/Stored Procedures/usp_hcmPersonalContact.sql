

CREATE  PROCEDURE [trf].[usp_hcmPersonalContact]
AS 
BEGIN
			BEGIN TRAN
		BEGIN TRY
			DECLARE @ID AS uniqueIdentifier
			SET @ID = NEWID()
			DECLARE @rowcount INT,
					@startDate DateTime,
					@EndDate DateTime,
					@ErrorMessage NVARCHAR(MAX)

			/*INITIALIZATION*/
			SET @startDate = GETDATE()
TRUNCATE TABLE  [dbo].[HcmPersonalContactPersonStaging]

INSERT INTO [dbo].[HcmPersonalContactPersonStaging]
select [ISBENEFICIARY] = CASE WHEN mshr_isbeneficiary='200000000' THEN 0 
							  WHEN mshr_isbeneficiary='200000001' THEN 1
						ELSE mshr_isbeneficiary
						 END 
      ,[ISEMERGENCYCONTACT]=CASE WHEN mshr_isemergencycontact='200000000' THEN 0
								 WHEN mshr_isemergencycontact='200000001' THEN 1
						ELSE mshr_isemergencycontact
						END
      ,[ISDEPENDENT]=CASE WHEN mshr_isdependent='200000000' THEN 0
						  WHEN mshr_isdependent='200000001' THEN 1
						ELSE mshr_isdependent
						END
      ,[DEFINITIONGROUP]='RPT'
      ,[EXECUTIONID]='RPT-'+CAST(FORMAT(GETDATE(),'yyyymmddhhmmss-') AS nvarchar(max))+CAST(@ID AS nvarchar(max))
      ,[ISSELECTED]=0
      ,[TRANSFERSTATUS]=0
      ,[WORKERPERSONNELNUMBER]=mshr_workerpersonnelnumber
      ,[CONTACTPERSONPARTYNUMBER]=mshr_contactpersonpartynumber
      ,[RELATIONSHIPTYPE]=mshr_relationshiptype
      ,[RELATIONSHIPVALIDFROM]=mshr_relationshipvalidfrom
      ,[RELATIONSHIPVALIDTO]=mshr_relationshipvalidto
      ,[CONTACTFIRSTNAME]=mshr_contactfirstname
      ,[CONTACTMIDDLENAME]=mshr_contactmiddlename
      ,[CONTACTLASTNAMEPREFIX]=mshr_contactlastnameprefix
      ,[CONTACTLASTNAME]=mshr_contactlastname
      ,[EMERGENCYCONTACTPRIMARYSECONDARY]=CASE  WHEN mshr_emergencycontactprimarysecondary='200000000' THEN 0
												WHEN mshr_emergencycontactprimarysecondary='200000001' THEN 1
											ELSE mshr_emergencycontactprimarysecondary
										  END
      ,[ISDEPENDENTCOURTORDERED]=CASE   WHEN mshr_isdependent='200000000' THEN 0
										WHEN mshr_isdependent='200000001' THEN 1
								 ELSE mshr_isdependent
								END 
      ,[ISDEPENDENTDOMESTICPARTNERVERIFIED]=''
      ,[DEPENDENTCOURTORDEREDEXPIRATIONDATE]=''
      ,[GENDER]=CASE   WHEN mshr_gender='200000000' THEN 0
					   WHEN mshr_gender='200000002' THEN 2
				ELSE mshr_gender
				END  
      ,[BIRTHDATE]=''--mshr_birthdate
      ,[ISFULLTIMESTUDENT]=CASE  WHEN mshr_isfulltimestudent='200000000' THEN 0
								 WHEN mshr_isfulltimestudent='200000001' THEN 1
							ELSE mshr_isfulltimestudent
							END
      ,[ISDISABLED]=CASE  WHEN mshr_isdisabled='200000000' THEN 0
						  WHEN mshr_isdisabled='200000001' THEN 1
					ELSE mshr_isdisabled
					END
										  
      ,[DISABLEDVERIFICATIONDATE]=''--mshr_disabledverificationdate
      ,[PARTITION]='initial'
      ,[SYNCSTARTDATETIME]= GETDATE()
      ,[RECID] =ROW_NUMBER() OVER ( ORDER BY mshr_workerpersonnelnumber )
--select * 
from [hr].[mshr_hcmpersonalcontactpersonentity]
--WHERE mshr_workerpersonnelnumber='E-000004'


		SELECT @rowcount = @@ROWCOUNT
		END TRY 
		BEGIN CATCH
			/*Catch Error Message */                          
			SELECT 
				 @ErrorMessage = ERROR_NUMBER()+''
								+ERROR_SEVERITY()+''
								+ERROR_STATE()+''
								+ERROR_PROCEDURE()+''
								+ERROR_LINE()+''
								+ERROR_MESSAGE()
		END CATCH

		SELECT @EndDate  = GETDATE()
		INSERT INTO [audit].[HCMAuditLog]
		SELECT '[dbo].[HcmPersonalContactPersonStaging]',CAST(GETDATE() AS date),@startDate,@EndDate,@rowcount,ISNULL(@ErrorMessage,'No errors')
		COMMIT TRAN
END
