




CREATE PROCEDURE [trf].[usp_hcmEthnicOrigin]
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
				

		TRUNCATE TABLE [dbo].[HcmEthnicOriginStaging]
		
		INSERT INTO [dbo].[HcmEthnicOriginStaging]
		SELECT *
			  ,[RECID] = ROW_NUMBER() OVER ( ORDER BY [DESCRIPTION] )
		FROM (
				SELECT DISTINCT
				       [DEFINITIONGROUP]='RPT'
					  ,[EXECUTIONID]='RPT-'+CAST(FORMAT(GETDATE(),'yyyymmddhhmmss-') AS nvarchar(max))+CAST(@ID AS nvarchar(max))
					  ,[ISSELECTED]=0
					  ,[TRANSFERSTATUS]=0
				      ,[DESCRIPTION] = ethnicorgin.cdm_Description
				      ,[ETHNICORIGINID] = ISNULL(ethnicorgin.cdm_name,'')
				      ,[EEOETHNICORIGIN] = ISNULL(workerpersonaldetails.cdm_ethnicoriginidname,'')
				      ,[PARTITION]='initial'
				      ,[SYNCSTARTDATETIME]= GETDATE()
				      --,[RECID] = ROW_NUMBER() OVER ( ORDER BY ethnicorgin.cdm_Description )
				--select * 
				FROM [hr].[stg_tblcdmworkerpersonaldetail] workerpersonaldetails
					inner join [hr].[stg_tblcdmethnicorigin] ethnicorgin
						on workerpersonaldetails.cdm_ethnicoriginid = ethnicorgin.cdm_ethnicoriginid
			) dat
		
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
		SELECT ' [dbo].[HcmEthnicOriginStaging]',CAST(GETDATE() AS date),@startDate,@EndDate,@rowcount,ISNULL(@ErrorMessage,'No errors')
		COMMIT TRAN
		
END
