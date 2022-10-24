
CREATE PROCEDURE [trf].[usp_hcmlanguagecode]
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

TRUNCATE TABLE [dbo].[HcmLanguageCodeStaging]

INSERT INTO [dbo].[HcmLanguageCodeStaging]
SELECT [DEFINITIONGROUP]='RPT'
      ,[EXECUTIONID]='RPT-'+CAST(FORMAT(GETDATE(),'yyyymmddhhmmss-') AS nvarchar(max))+CAST(@ID AS nvarchar(max))
      ,[ISSELECTED]=0
      ,[TRANSFERSTATUS]=0
      ,[DESCRIPTION]=[cdm_description]
      ,[LANGUAGECODEID]= [cdm_name]
      ,[PARTITION]='initial'
      ,[SYNCSTARTDATETIME]= GETDATE()
      ,[RECID]= ROW_NUMBER() OVER (  ORDER BY [cdm_name]  )
  FROM [hr].[stg_tblcdmlanguage]



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
		SELECT '[dbo].[HcmLanguageCodeStaging]',CAST(GETDATE() AS date),@startDate,@EndDate,@rowcount,ISNULL(@ErrorMessage,'No errors')
		COMMIT TRAN
END
