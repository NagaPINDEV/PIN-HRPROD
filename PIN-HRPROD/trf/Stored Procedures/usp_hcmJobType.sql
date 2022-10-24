

CREATE  PROCEDURE [trf].[usp_hcmJobType]
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

TRUNCATE TABLE [dbo].[HcmJobTypeStaging]


INSERT INTO [dbo].[HcmJobTypeStaging]
SELECT [DEFINITIONGROUP]='RPT'
      ,[EXECUTIONID]='RPT-'+CAST(FORMAT(GETDATE(),'yyyymmddhhmmss-') AS nvarchar(max))+CAST(@ID AS nvarchar(max))
      ,[ISSELECTED]=0
      ,[TRANSFERSTATUS]=0
      ,[DESCRIPTION]=cdm_Description
      ,[EXEMPTSTATUS]= CASE 
							WHEN cdm_ExemptStatus='754400000' THEN 1 
							WHEN cdm_ExemptStatus='754400001' THEN 2
						ELSE cdm_ExemptStatus
						END 
      ,[JOBTYPEID]=cdm_Name
      ,[PAIDHOURLY]=CASE WHEN cdm_Description='Not Paid Overtime' THEN 0 
						 WHEN cdm_Description='Paid Overtime' THEN 1
					ELSE cdm_Description
					END 
      ,[PARTITION]='initial'
      ,[SYNCSTARTDATETIME]=GETDATE()
      ,[RECID]=ROW_NUMBER() OVER (  ORDER BY cdm_Description  )
FROM [hr].[stg_tblcdmjobtype]


			/*Get Record Count*/
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
		SELECT '[dbo].[HcmJobTypeStaging]',CAST(GETDATE() AS date),@startDate,@EndDate,@rowcount,ISNULL(@ErrorMessage,'No errors')
		COMMIT TRAN
END
