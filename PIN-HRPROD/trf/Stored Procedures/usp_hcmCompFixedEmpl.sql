

CREATE PROCEDURE [trf].[usp_hcmCompFixedEmpl]
AS 
BEGIN

TRUNCATE TABLE  [dbo].[HcmCompFixedEmplStaging]

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

		INSERT INTO  [dbo].[HcmCompFixedEmplStaging]
		SELECT 
			   [DIMENSIONDISPLAYVALUE] = ''
		      ,[DEFINITIONGROUP]='Leave_Export'
		      ,[EXECUTIONID]='Leave_Export-'+CAST(FORMAT(GETDATE(),'yyyymmddhhmmss-') AS nvarchar(max))+CAST(@ID AS nvarchar(max))
		      ,[ISSELECTED]=0
		      ,[TRANSFERSTATUS]=0
		      ,[ACTION]=fixedcompensation.cdm_name --posworassign.mshr_reasoncodeid
						
		      ,[LINENUMBER]=workerfixedcompensation.cdm_LineNumber
		      ,[PAYFREQUENCY]=''--workerfixedcompensation.cdm_PayFrequencyId
		      ,[PAYRATE]=workerfixedcompensation.cdm_PayRate
		      ,[PLAN_]=ISNULL(workerfixedcompensation.cdm_planidname,'')
		      ,[PROCESSTYPE]=workerfixedcompensation.cdm_ProcessType
		      ,[STEP]=''
		      ,[TYPE]=''
		      ,[EFFECTIVEDATE]=workerfixedcompensation.cdm_EffectiveDate
		      ,[EXPIRATIONDATE]=workerfixedcompensation.cdm_ExpirationDate
		      ,[POSITIONID]=pos.cdm_jobpositionnumber
		      ,[PERSONNELNUMBER]=worker.cdm_workernumber
		      ,[COMPENSATIONLEVELID]=ISNULL(workerfixedcompensation.cdm_compensationlevelidname,'')
		      ,[PARTITION]='initial'
		      ,[DATAAREAID]=company.cdm_companycode
		      ,[SYNCSTARTDATETIME]=GETDATE()
		      ,[RECID]=ROW_NUMBER() OVER (  ORDER BY worker.cdm_workernumber  )
		--select distinct cdm_compensationlevelidname
		FROM [hr].[stg_tblcdmworkerfixedcompensation] workerfixedcompensation
			
			join [hr].[stg_tblcdmpositionworkerassignment] pwmap
					on workerfixedcompensation.cdm_PositionId = pwmap.cdm_jobpositionid
					and workerfixedcompensation.cdm_workerid = pwmap.cdm_workerid
					
		
			join [hr].[stg_tblcdmjobposition] pos
					on  pwmap.cdm_jobpositionid = pos.cdm_jobpositionid
			
			join [hr].[stg_tblcdmworker] worker
					on pwmap.cdm_workerid = worker.cdm_workerid
			
			join [hr].[mshr_hcmpositionworkerassignment] posworassign
					on 	posworassign.mshr_positionid = pos.cdm_jobpositionnumber
					and posworassign.mshr_personnelnumber=worker.cdm_workernumber
			
			join [hr].[stg_tblcdmfixedcompensationevent] fixedcompensation
					on workerfixedcompensation.cdm_companyid = fixedcompensation.[cdm_companyid]
						and workerfixedcompensation.cdm_eventid = fixedcompensation.cdm_fixedcompensationeventid
		
			join [hr].[stg_tblcdmcompany] company
					on company.cdm_companyid = workerfixedcompensation.cdm_companyid
		--where worker.cdm_workernumber='E-000043'
		
		--cdm_fixedcompensationeventid

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
		SELECT ' [dbo].[HcmCompFixedEmplStaging]',CAST(GETDATE() AS date),@startDate,@EndDate,@rowcount,ISNULL(@ErrorMessage,'No errors')
		COMMIT TRAN
END
