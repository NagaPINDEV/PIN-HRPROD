CREATE  PROCEDURE [trf].[usp_hcmEmploymentDetails]
AS 
BEGIN
	
	TRUNCATE TABLE [dbo].[HcmEmploymentDetailStaging]

	DECLARE @ID AS uniqueIdentifier
	SET @ID = NEWID()

	INSERT INTO [dbo].[HcmEmploymentDetailStaging]
	SELECT [DEFINITIONGROUP]='RPT'
	      ,[EXECUTIONID]='RPT-'+CAST(FORMAT(GETDATE(),'yyyymmddhhmmss-') AS nvarchar(max))+CAST(@ID AS nvarchar(max))
	      ,[ISSELECTED]=0
	      ,[TRANSFERSTATUS]=0
		  ,[ADJUSTEDWORKERSTARTDATE]=CAST ( '1900-01-01 00:00:00' AS DATETIME) 
	      ,[EMPLOYERNOTICEAMOUNT]=mshr_workernoticeamount
	      ,[EMPLOYERUNITOFNOTICE]=mshr_workerunitofnotice
		  ,[LASTDATEWORKED] = mshr_employmentenddate
	      ,[TRANSITIONDATE]=ISNULL(mshr_transitiondate,'')
	      ,[VALIDFROM]=mshr_validfrom
	      ,[VALIDTO]=mshr_validto
	      ,[WORKERNOTICEAMOUNT]=mshr_workernoticeamount
		  ,[WORKERSTARTDATE]=mshr_employmentstartdate
	      ,[WORKERUNITOFNOTICE]=mshr_workerunitofnotice
	      ,[EMPLOYMENTSTARTDATE]=mshr_employmentstartdate
	      ,[EMPLOYMENTENDDATE]=mshr_employmentenddate
	      ,[LEGALENTITYID]=mshr_legalentityid
	      ,[PERSONNELNUMBER]=mshr_personnelnumber
	      ,[REASONCODEID]=mshr_reasoncodeid
	      ,[EMPLOYMENTTYPE]=mshr_employmenttype
	      ,[PARTITION]='Initial'
	      ,[EMPLOYMENTTYPEID]=mshr_employmenttypeid
	      ,[EMPLOYMENTCATEGORYID]=mshr_employmentcategoryid
	      ,[BENEFITEMPLOYMENTSTATUS]=mshr_benefitemploymentstatus
	      ,[PAYFREQUENCYID]=mshr_payfrequencyid
	      ,[SYNCSTARTDATETIME]=getdate()
	      ,[RECID]=ROW_NUMBER() OVER (  ORDER BY mshr_personnelnumber  )
	  --select * 
	FROM [hr].[mshr_hcmemploymentdetailentity]

END 


