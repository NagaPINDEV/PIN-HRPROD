CREATE PROCEDURE [trf].[usp_LeaveEnrollmentV2]
AS 
BEGIN

DECLARE @ID AS uniqueIdentifier
			SET @ID = NEWID()
TRUNCATE TABLE [dbo].[LeaveEnrollmentV2Staging]

INSERT INTO [dbo].[LeaveEnrollmentV2Staging]
SELECT 
	   [DEFINITIONGROUP]='RPT'
      ,[EXECUTIONID]='RPT-'+CAST(FORMAT(GETDATE(),'yyyymmddhhmmss-') AS nvarchar(max))+CAST(@ID AS nvarchar(max))
      ,[ISSELECTED]=0
      ,[TRANSFERSTATUS]=0
      ,[ISACCRUALSUSPENDED]=leaveenrollment.cdm_isaccrualsuspended
      ,[TIERBASIS]=CASE WHEN leaveenrollment.cdm_tierbasis='754400000'  THEN 0 
						WHEN leaveenrollment.cdm_tierbasis='754400002'  THEN 2
					 ELSE leaveenrollment.cdm_tierbasis
					END 
      ,[CUSTOMDATE]=leaveenrollment.cdm_customdate
      ,[STARTDATE]=leaveenrollment.cdm_startdate
      ,[ENDDATE]=leaveenrollment.cdm_enddate
      ,[ACCRUALSTARTDATE]=leaveenrollment.cdm_accrualstartdate
      ,[ACCRUALDATEBASIS]=leaveenrollment.cdm_accrualdatebasis
      ,[PERSONNELNUMBER] = worker.cdm_workernumber
      ,LEAVEPLANID=leaveplan.cdm_name
      ,[PARTITION]='Initial'
      ,[DATAAREAID]=company.cdm_companycode
      ,[SYNCSTARTDATETIME]= GETDATE()
      ,[RECID] = ROW_NUMBER() OVER ( ORDER BY leaveenrollment.cdm_leaveenrollmentnumber) 	
--select * 
FROM [hr].[stg_tblcdmleaveenrollment] leaveenrollment
	inner join [hr].[stg_tblcdmleaveplan] leaveplan
			on leaveplan.cdm_leaveplanid = leaveenrollment.cdm_leaveplanid
	inner join [hr].[stg_tblcdmworker] worker
			on leaveenrollment.cdm_workerid = worker.cdm_workerid
	inner join [hr].[stg_tblcdmcompany] company
			on leaveenrollment.cdm_companyid = company.cdm_companyid
--where worker.cdm_workernumber='E-002477'
END

