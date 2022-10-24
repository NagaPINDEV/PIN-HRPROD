
CREATE   PROCEDURE [trf].[usp_hcmPositionWorkerAssignment]
AS 
BEGIN


BEGIN TRAN
		BEGIN TRY
			
			
			DECLARE @rowcount INT,
					@startDate DateTime,
					@EndDate DateTime,
					@ErrorMessage NVARCHAR(MAX)

			/*INITIALIZATION*/
			SET @startDate = GETDATE()

DECLARE @ID AS uniqueIdentifier
SET @ID = NEWID()

TRUNCATE TABLE [dbo].[HcmPositionWorkerAssignmentV2Staging]

INSERT INTO [dbo].[HcmPositionWorkerAssignmentV2Staging]
SELECT 
	   [ISPRIMARYPOSITION]=CASE WHEN mshr_isprimaryposition='200000000' THEN 0 
								WHEN mshr_isprimaryposition='200000001' THEN 1 
							 ELSE ''
						   END 
      ,[DEFINITIONGROUP]='RPT'
      ,[EXECUTIONID]='RPT-'+CAST(FORMAT(GETDATE(),'yyyymmddhhmmss-') AS nvarchar(max))+CAST(@ID AS nvarchar(max))
      ,[ISSELECTED]=0
      ,[TRANSFERSTATUS]=0
      ,[POSITIONID]=mshr_positionid
      ,[PERSONNELNUMBER]=mshr_personnelnumber
      ,[REASONCODEID]=mshr_reasoncodeid
      ,[VALIDFROM]=mshr_validfrom
      ,[VALIDTO]=mshr_validto
      ,[PARTITION]='Initial'
      ,[SYNCSTARTDATETIME]= GETDATE()
      ,[RECID]= ROW_NUMBER() OVER (ORDER BY mshr_personnelnumber )
FROM [hr].[mshr_hcmpositionworkerassignment]

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
		SELECT '[dbo].[HcmPositionWorkerAssignmentV2Staging]',CAST(GETDATE() AS date),@startDate,@EndDate,@rowcount,ISNULL(@ErrorMessage,'No errors')
		COMMIT TRAN



END
