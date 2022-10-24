CREATE PROCEDURE [trf].[usp_LeavePlanTierV2]
/*
-- =======================================================================================================================================
-- Author		:
-- Create Date	:  19/10/2022
-- Description	: 
-- NOTE			:  anything changed here needs to be changed in the [trf].[usp_LeavePlanTierV2]
-- 11/10/2022   : 
-- 12/10/2022   : 
-- 
-- 
-- =======================================================================================================================================
*/
AS 
BEGIN

TRUNCATE TABLE [dbo].[LeavePlanTierV2Staging]

DECLARE @ID AS uniqueIdentifier
SET @ID = NEWID()

INSERT INTO [dbo].[LeavePlanTierV2Staging]
SELECT  A.*
	   ,[RECID] = ROW_NUMBER() OVER ( ORDER BY A.[EXECUTIONID])
FROM (
		SELECT DISTINCT 
			   [DEFINITIONGROUP]='RPT'
			  ,[EXECUTIONID]='RPT-'+CAST(FORMAT(GETDATE(),'yyyymmddhhmmss-') AS nvarchar(max))+CAST(@ID AS nvarchar(max))
			  ,[ISSELECTED]=0
			  ,[TRANSFERSTATUS]=0
				----------------------------------------------------------------------
		      ,[ACCRUALAMOUNT]= 0 --leavebanktran.cdm_amount 
			  ,[GRANT_]= 0 
		      ,[TIERNUMBER]=0 
		      ,[MAXIMUMBALANCE]=0 
		      ,[MAXIMUMCARRYOVER]=0 
		      ,[MINIMUMBALANCE]=0 
		      ,[MONTHSOFSERVICE]=0 
		      ,[QUALIFYINGAMOUNT]=0 
			  --------------------------------------------------------------------------
		      ,[LEAVEPLANID]=leaveplan.cdm_name
		      ,[USEFULLTIMEEQUIVALENCY]=0 
		      ,[LEAVETYPEID]=ISNULL(leavetype.cdm_description,'')
		      ,[PARTITION] = 'Initial'
		      ,[DATAAREAID] = ISNULL(company.cdm_companycode,'')
		      ,[SYNCSTARTDATETIME] = GETDATE()
		      --,[RECID] = 0-- ROW_NUMBER() OVER ( ORDER BY leavetype.cdm_description )  
		--select worker.* 
		from [hr].[stg_tblcdmleaveplan] leaveplan
				left join [hr].[stg_tblcdmleavebanktransaction] leavebanktran
						on leaveplan.cdm_leaveplanid = leavebanktran.cdm_leaveplanid
				left join [hr].[stg_tblcdmworker] worker
						on leavebanktran.cdm_workerid = worker.cdm_workerid
				left join [hr].[stg_tblcdmleavetype] leavetype
						on leavebanktran.cdm_leavetypeid = leavetype.cdm_leavetypeid
				left join [hr].[stg_tblcdmcompany] company 
					on leaveplan.cdm_companyid = company.cdm_companyid
		--where leaveplan.cdm_name='24 - Europe'
	) A

END 
