

CREATE PROCEDURE [trf].[usp_hcmPositionHierarchy]
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

TRUNCATE TABLE [dbo].[HcmPositionHierarchyStaging]

DECLARE @ID AS uniqueIdentifier
SET @ID = NEWID()

INSERT INTO [dbo].[HcmPositionHierarchyStaging]
select 
	   [DEFINITIONGROUP] = 'RPT'
      ,[EXECUTIONID] ='RPT-'+CAST(FORMAT(GETDATE(),'yyyymmddhhmmss-') AS nvarchar(max))+CAST(@ID AS nvarchar(max))
      ,[ISSELECTED] = 0 
      ,[TRANSFERSTATUS] = 0 
      ,[VALIDFROM] = mshr_validfrom
      ,[VALIDTO]=mshr_validto
      ,[POSITIONID]=mshr_positionid
      ,[PARENTPOSITIONID]=mshr_parentpositionid
      ,[HIERARCHYTYPENAME]=mshr_hierarchytypename
      ,[PARTITION]='?'
      ,[SYNCSTARTDATETIME]= GETDATE()
      ,[RECID] =  ROW_NUMBER() OVER ( ORDER BY mshr_positionid)
from [hr].[mshr_hcmpositionhierarchyentity]


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
		SELECT '[dbo].[HcmPositionHierarchyStaging]',CAST(GETDATE() AS date),@startDate,@EndDate,@rowcount,ISNULL(@ErrorMessage,'No errors')
		COMMIT TRAN


END
