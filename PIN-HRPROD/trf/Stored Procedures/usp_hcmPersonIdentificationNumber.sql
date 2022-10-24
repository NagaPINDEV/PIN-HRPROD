


CREATE PROCEDURE [trf].[usp_hcmPersonIdentificationNumber]
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
TRUNCATE TABLE [dbo].[HcmPersonIdentificationNumberStaging]


INSERT INTO [dbo].[HcmPersonIdentificationNumberStaging]
SELECT
	   [DEFINITIONGROUP]='RPT'
      ,[EXECUTIONID]='RPT-'+CAST(FORMAT(GETDATE(),'yyyymmddhhmmss-') AS nvarchar(max))+CAST(@ID AS nvarchar(max))
      ,[ISSELECTED]=0
      ,[TRANSFERSTATUS]=0
      ,[ENTRYTYPE]=ISNULL(cdm_EntryType,' ')
      ,[DESCRIPTION]=ISNULL(workerpersonId.[cdm_description],' ')
	  ,[EXPIRATIONDATE]=cdm_ExpirationDate
      ,[ISPRIMARY]=cdm_IsPrimary
      ,[ISSUEDDATE]=cdm_IssueDate
      ,[IDENTIFICATIONNUMBER]=cdm_IdentificationNumber
      ,[PARTYNUMBER]=worker.cdm_workernumber
      ,[IDENTIFICATIONTYPEID]=CAST(workerpersonIdtype.cdm_name as nvarchar(100))
      ,[ISSUINGAGENCYID]=LEFt(ISNULL(workeraddress.cdm_city,''),15)
      ,[PARTITION]='initial'
      ,[SYNCSTARTDATETIME]=GETDATE()
      ,[RECID]=ROW_NUMBER() OVER ( ORDER BY cdm_IdentificationNumber DESC )
--select * 
from [hr].[stg_tblcdmworkerpersonidentificationnumber] workerpersonId
		left join [hr].[stg_tblcdmworkerpersonidentificationtype] workerpersonIdtype
				on workerpersonId.cdm_identificationtypeid = workerpersonIdtype.cdm_workerpersonidentificationtypeid
		left join [hr].[stg_tblcdmworker] worker
				on workerpersonId.cdm_workerid = worker.cdm_workerid
		left join [hr].[stg_tblcdmworkeraddress] workeraddress
				on worker.cdm_workerid = workeraddress.cdm_workerid







/*


SELECT [cdm_description]
      ,[cdm_entrytype]
      ,[cdm_expirationdate]
      ,[cdm_identificationnumber]
      ,[cdm_identificationtypeid]
      ,[cdm_identificationtypeidname]
      ,[cdm_isprimary]
      ,[cdm_issuedate]
      ,[cdm_issuingagencyid]
      ,[cdm_issuingagencyidname]
      ,[cdm_workerid]
      ,[cdm_workeridname]
      ,[cdm_workerpersonidentificationnumberid]
      ,[createdby]
      ,[createdbyname]
      ,[createdbyyominame]
      ,[createdon]
      ,[createdonbehalfby]
      ,[createdonbehalfbyname]
      ,[createdonbehalfbyyominame]
      ,[importsequencenumber]
      ,[modifiedby]
      ,[modifiedbyname]
      ,[modifiedbyyominame]
      ,[modifiedon]
      ,[modifiedonbehalfby]
      ,[modifiedonbehalfbyname]
      ,[modifiedonbehalfbyyominame]
      ,[overriddencreatedon]
      ,[ownerid]
      ,[owneridname]
      ,[owneridtype]
      ,[owneridyominame]
      ,[owningbusinessunit]
      ,[owningbusinessunitname]
      ,[owningteam]
      ,[owninguser]
      ,[statecode]
      ,[statuscode]
      ,[timezoneruleversionnumber]
      ,[utcconversiontimezonecode]
      ,[versionnumber]
  FROM [hr].[stg_tblcdmworkerpersonidentificationnumber]

  */
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
		SELECT '[dbo].[HcmPersonIdentificationNumberStaging]',CAST(GETDATE() AS date),@startDate,@EndDate,@rowcount,ISNULL(@ErrorMessage,'No errors')
		COMMIT TRAN
END
