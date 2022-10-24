CREATE PROCEDURE [trf].[usp_LeaveBankTransactionV2]
/*
-- =======================================================================================================================================
-- Author		:
-- Create Date	:  19/10/2022
-- Description	:  This process is to load the LeaveBankTransaction entity -- full load
-- NOTE			:  anything changed here needs to be changed in the [trf].[usp_LeaveBankTransactionV2]
-- 
-- 
-- 
-- 
-- =======================================================================================================================================
*/
AS 
BEGIN
TRUNCATE TABLE [dbo].[LeaveBankTransactionV2Staging]

DECLARE @ID AS uniqueIdentifier
SET @ID = NEWID()

INSERT INTO [dbo].[LeaveBankTransactionV2Staging]
SELECT  
			   [DEFINITIONGROUP]='RPT'
			  ,[EXECUTIONID]='RPT-'+cdm_companycode+'-'+CAST(FORMAT(GETDATE(),'yyyymmddhhmmss-') AS nvarchar(max))+CAST(@ID AS nvarchar(max))
			  ,[ISSELECTED]=0
			  ,[TRANSFERSTATUS]=0
			  ,[AMOUNT] =CAST(leavebanktransaction.cdm_amount AS decimal(10,6))
			  ,[TRANSACTIONDATE]=leavebanktransaction.cdm_transactiondate
			  ,[TRANSACTIONNUMBER]= leavebanktransaction.cdm_transactionnumber
			  ,[TRANSACTIONTYPE]= CASE WHEN leavebanktransaction.cdm_transactiontype='754400000' THEN 1
									   WHEN leavebanktransaction.cdm_transactiontype='754400001' THEN 2
									   WHEN leavebanktransaction.cdm_transactiontype='754400002' THEN 3
									   WHEN leavebanktransaction.cdm_transactiontype='754400003' THEN 4
									   WHEN leavebanktransaction.cdm_transactiontype='754400004' THEN 5
									ELSE ''
									END 
			  ,LEAVETYPEID = ISNULL(leavetype.cdm_type,'')
			  ,PERSONNELNUMBER = worker.cdm_workernumber
			  ,LEAVEPLANID = ISNULL(leaveplan.cdm_name,'')
			  ,[HALFDAYDEFINITION]=0
			  ,[PARTITION]='Inital'
			  ,[COMMENT_]= leavebanktransaction.cdm_comments_custom
			  ,DATAAREAID = company.cdm_companycode
			  ,SYNCSTARTDATETIME = GETDATE()
			  ,RECID =ROW_NUMBER() OVER (ORDER BY leavebanktransaction.cdm_transactionnumber)
from hr.stg_tblcdmleavebanktransaction leavebanktransaction	
	left join [hr].stg_tblcdmworker worker
			on leavebanktransaction.cdm_workerid = worker.cdm_workerid
	left join [hr].[stg_tblcdmleaveplan] leaveplan
			on leavebanktransaction.cdm_leaveplanid = leaveplan.cdm_leaveplanid
			and leavebanktransaction.cdm_companyid = leaveplan.cdm_companyid
	left join [hr].[stg_tblcdmleavetype] leavetype
			on leavebanktransaction.cdm_leavetypeid = leavetype.cdm_leavetypeid
				and leavebanktransaction.cdm_companyid = leavetype.cdm_companyid
	left join [hr].[stg_tblcdmcompany] company 
			on leavebanktransaction.cdm_companyid = company.cdm_companyid
END
