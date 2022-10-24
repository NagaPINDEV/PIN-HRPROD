
CREATE PROCEDURE [trf].[usp_hcmIssuingAgency]
AS 
BEGIN

--select * from [dbo].[HcmIssuingAgencyStaging]
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

TRUNCATE TABLE [dbo].[HcmIssuingAgencyStaging]

INSERT INTO [dbo].[HcmIssuingAgencyStaging]
SELECT 
	   [ADDRESSCOUNTRYREGIONISOCODE]=''
      ,[DEFINITIONGROUP]='RPT'
      ,[EXECUTIONID]='RPT-'+CAST(FORMAT(GETDATE(),'yyyymmddhhmmss-') AS nvarchar(max))+CAST(@ID AS nvarchar(max))
      ,[ISSELECTED]=0
      ,[TRANSFERSTATUS]=0
      ,[EMAIL]=ISNULL(cdm_Email,'')
      ,[ISSUINGAGENCY]=cdm_name
      ,[NAME]=''
      ,[PAGER]=''
      ,[TELEPHONE]=ISNULL(cdm_Telephone,'')
      ,[EXTENSION]=ISNULL(cdm_Extension,'')
      ,[MOBILEPHONE]=ISNULL(cdm_MobilePhone,'')
      ,[SMS]=''
      ,[FAX]=ISNULL(cdm_Fax,'')
      ,[TELEXNUMBER]=''
      ,[INTERNETADDRESS]=ISNULL(cdm_WebsiteUrl,'')
      ,[ADDRESSLOCATIONID]=''
      ,[ADDRESSDESCRIPTION]=ISNULL(cdm_AddressDescription,'')
      ,[ADDRESSCOUNTRYREGIONID]= ISNULL(cdm_CountryRegion,'')
      ,[ADDRESSZIPCODE]=ISNULL(cdm_PostalCode,'')
      ,[ADDRESSCOUNTY]=ISNULL(cdm_County,'')
      ,[ADDRESSSTREET]=ISNULL(cdm_Street,'')
      ,[ADDRESSCITY]= ISNULL(cdm_City,'')
      ,[ADDRESSSTATE]=ISNULL(cdm_StateorProvince,'')
      ,[ADDRESSVALIDFROM]=''
      ,[ADDRESSVALIDTO]=''
      ,[PARTITION]='initial'
      ,[SYNCSTARTDATETIME]=GETDATE()
      ,[RECID]=ROW_NUMBER() OVER (  ORDER BY cdm_name  )
FROM [hr].[stg_tblcdmpersonidentificationissuingagency]



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
		SELECT '[dbo].[HcmIssuingAgencyStaging]',CAST(GETDATE() AS date),@startDate,@EndDate,@rowcount,ISNULL(@ErrorMessage,'No errors')
COMMIT TRAN

END
