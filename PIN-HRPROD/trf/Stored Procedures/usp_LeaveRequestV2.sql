CREATE PROCEDURE [trf].[usp_LeaveRequestV2]
/*
-- =======================================================================================================================================
-- Author		:
-- Create Date	:  18/10/2022
-- Description	: 
-- NOTE			:  anything changed here needs to be changed in the [trf].[usp_LeaveRequest]
-- 11/10/2022   : 
-- 12/10/2022   : 
-- 
-- 
-- =======================================================================================================================================
*/
AS 
BEGIN

TRUNCATE TABLE [dbo].[LeaveRequestV2Staging]

DECLARE @ID AS uniqueIdentifier
SET @ID = NEWID()

INSERT INTO [dbo].[LeaveRequestV2Staging]
SELECT 
		 [DEFINITIONGROUP]='RPT'
		,[EXECUTIONID]='RPT-'+CAST(FORMAT(GETDATE(),'yyyymmddhhmmss-') AS nvarchar(max))+CAST(@ID AS nvarchar(max))
		,[ISSELECTED]=0
		,[TRANSFERSTATUS]=0
		,* 
		, RECID = ROW_NUMBER() OVER ( ORDER BY dat.REQUESTID ) 	
FROM 
	(
	SELECT  DISTINCT
		 REQUESTID = cdmleaverequest.cdm_leaverequestnumber  
		,LEAVETYPE = cdmleavetype.cdm_type
		,LEAVEDATE = cdmleaverequestdetails.cdm_leavedate
		,AMOUNT=cdmleaverequestdetails.cdm_amount
		,HALFDAYDEFINITION = 0
		,[COMMENT_] = cdmleaverequest.cdm_comment
		
		,[STATUS] = CASE WHEN cdmleaverequest.cdm_status='754400000' THEN 0 
						 WHEN cdmleaverequest.cdm_status='754400001' THEN 2
						 WHEN cdmleaverequest.cdm_status='754400002' THEN 9
						 WHEN cdmleaverequest.cdm_status IS NULL THEN 3
					END 
		,[REQUESTDATE]= cdmleaverequest.cdm_requestdate
		,[PERSONNELNUMBER] = worker.cdm_workernumber
		------------------------------------------------------------------
		--- IGNORE FOR NOW as we still need to identify the definition 
		,[ISSUBMITTEDONBEHALFOF]=0
		,[ISSUBMITTEDBYMANAGER]=0
		,[ISSUBMITTEDBYHUMANRESOURCES]=0
		,[SUBMITTEDUSER]=USER
		,[REASONCODEID]=''
		-------------------------------------------------------------------
		,[PARTITION] = 'initial'
		,DATAAREAID = company.cdm_companycode
		,SYNCSTARTDATETIME = GETDATE()
	--select *
	from [hr].[stg_tblcdmleaverequest] cdmleaverequest
		join [hr].[stg_tblcdmleaverequestdetail] cdmleaverequestdetails
				on cdmleaverequest.cdm_leaverequestid = cdmleaverequestdetails.cdm_leaverequestid
		join  [hr].[stg_tblcdmleavetype] cdmleavetype
				on cdmleaverequestdetails.cdm_leavetypeid = cdmleavetype.cdm_leavetypeid
		join [hr].[stg_tblcdmworker] worker
				on cdmleaverequest.cdm_workerid  = worker.cdm_workerid
		join [hr].[stg_tblcdmleavebanktransaction] cdmleavebanktran
				on cdmleavetype.cdm_leavetypeid = cdmleavebanktran.cdm_leavetypeid
		join hr.stg_tblcdmcompany company
				on cdmleaverequest.cdm_companyid = company.cdm_companyid
		--where cdmleaverequest.cdm_leaverequestnumber='PI03-00006677'
	) dat

END 

