


CREATE PROCEDURE [trf].[usp_hcmPositons]
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


TRUNCATE TABLE [dbo].[HcmPositionV2Staging]

DECLARE @ID AS uniqueIdentifier
SET @ID = NEWID()

INSERT INTO [dbo].[HcmPositionV2Staging]
SELECT [DEFINITIONGROUP],[EXECUTIONID],[ISSELECTED],[TRANSFERSTATUS]
      ,[POSITIONID],[AVAILABLEFORASSIGNMENT],[DESCRIPTION],[FULLTIMEEQUIVALENT]
      ,[DETAILEFFECTIVE],[DETAILEXPIRATION],[DEPARTMENTNUMBER],[COMPENSATIONREGIONID]
      ,[JOBID],[POSITIONTYPEID],[TITLEID],[ACTIVATION],[RETIREMENT],[WORKERASSIGNMENTSTART]
      ,[WORKERASSIGNMENTEND],[WORKERPERSONNELNUMBER],[WORKERASSIGNMENTREASONCODEID]
      ,[WORKERNAME],[PAIDBYLEGALENTITY],[PAYCYCLEID],[ANNUALREGULARHOURS]
      ,[PAYROLLDETAILEFFECTIVE],[PAYROLLDETAILEXPIRATION],[PARTITION]
      ,[OFFICE_CUSTOM],[TEAM_CUSTOM],[EEOJOBCLASSIFICATION_CUSTOM]
      ,[TEAMV2_CUSTOM],[SYNCSTARTDATETIME],[SYNCENDDATETIME] 
      ,[RECID] = ROW_NUMBER() OVER ( ORDER BY dat.[RECENTRECID] DESC )
FROM (
		select  
				 [DEFINITIONGROUP]='RPT'
				,[EXECUTIONID]='RPT-'+CAST(FORMAT(GETDATE(),'yyyymmddhhmmss-') AS nvarchar(max))+CAST(@ID AS nvarchar(max))
				,[ISSELECTED]=0
				,[TRANSFERSTATUS]=0
				,[POSITIONID]=pd.[mshr_positionid]
				,[AVAILABLEFORASSIGNMENT]=CAST(ISNULL(pd.[mshr_availableforassignment],'1900-01-01') AS datetime) 
				,[DESCRIPTION]=pd.[mshr_description]
				,[FULLTIMEEQUIVALENT]=pd.[mshr_fulltimeequivalent]
				,[DETAILEFFECTIVE]=pd.[mshr_validfrom]
				,[DETAILEXPIRATION]=pd.[mshr_validto]
				,[DEPARTMENTNUMBER]=pd.[mshr_departmentnumber]
				,[COMPENSATIONREGIONID]=pd.[mshr_compensationregionid]
				,[JOBID]=pd.[mshr_jobid]
				,[POSITIONTYPEID]=pd.[mshr_positiontypeid]
				,[TITLEID]=pd.[mshr_titleid]
				,[ACTIVATION]=pd.[mshr_validfrom]
				,[RETIREMENT]=pd.[mshr_validto]
				,[WORKERASSIGNMENTSTART]=pd.[mshr_validfrom]
				,[WORKERASSIGNMENTEND]=pd.[mshr_validto]
				,[WORKERPERSONNELNUMBER] = worker.cdm_workernumber
				,[WORKERASSIGNMENTREASONCODEID] = '?' 
				,[WORKERNAME] = ISNULL(cdm_fullname,'')
				,[PAIDBYLEGALENTITY]=''
				,[PAYCYCLEID]=''
				,[ANNUALREGULARHOURS]=CAST('0.000000' AS decimal(10,7))
				,[PAYROLLDETAILEFFECTIVE]=CAST('1900-01-01' AS datetime)
				,[PAYROLLDETAILEXPIRATION]=CAST('1900-01-01' AS datetime)
				,[PARTITION]='?'
				,[OFFICE_CUSTOM] = pd.mshr_office_custom
				,[TEAM_CUSTOM] = pd.mshr_team_custom
				,[EEOJOBCLASSIFICATION_CUSTOM]=''
				,[TEAMV2_CUSTOM]=pd.mshr_compensationregionid+pd.mshr_departmentnumber+pd.mshr_team_custom
				,[SYNCSTARTDATETIME]= GETDATE()
				,[SYNCENDDATETIME] = NULL
				,[RECENTRECID] = ROW_NUMBER() OVER ( PARTITION BY pd.mshr_positionid ORDER BY pd.[mshr_validto] DESC )
		--select cdm_fullname,* 
		from [hr].[stg_tblcdmjobposition] pos
				inner join [hr].[stg_tblcdmpositionworkerassignment] pwmap
						on pos.cdm_jobpositionid = pwmap.cdm_jobpositionid
				inner join [hr].[stg_tblcdmworker] worker
						on pwmap.cdm_workerid = worker.cdm_workerid
				inner join hr.mshr_hcmpositiondetailentity pd
						on pd.mshr_positionid = pos.cdm_jobpositionnumber
		--where pd.mshr_positionid='P-002592'
	) dat	
WHERE 	dat.RECENTRECID=1



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
		SELECT '[dbo].[HcmPositionV2Staging]',CAST(GETDATE() AS date),@startDate,@EndDate,@rowcount,ISNULL(@ErrorMessage,'No errors')
		COMMIT TRAN





END 
