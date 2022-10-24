/****** Object:  StoredProcedure [trf].[DirPersonUserStaging]    Script Date: 20/10/2022 09:38:20 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
CREATE PROCEDURE [trf].[DirPersonUserStaging]
AS 
BEGIN

TRUNCATE TABLE [dbo].[DirPersonUserStaging]

DECLARE @ID AS uniqueIdentifier
SET @ID = NEWID()

INSERT INTO [dbo].[DirPersonUserStaging]
SELECT 
	   [DEFINITIONGROUP]='RPT'
	  ,[EXECUTIONID]='RPT-'+CAST(FORMAT(GETDATE(),'yyyymmddhhmmss-') AS nvarchar(max))+CAST(@ID AS nvarchar(max))
	  ,[ISSELECTED]=0
	  ,[TRANSFERSTATUS]=0
	  ,LEFT([FIRSTNAME]+'.'+LASTNAME,20) [USERID]
      --,[PARTYNUMBER]
	  ,[PERSONNELNUMBER]
	  ,[Name] [PERSONNAME]
	  ,[NAMEALIAS] [PERSONNAMEALIAS]
	  ,[IDENTITYEMAIL]  AS USEREMAIL
	  ,[PRIMARYCONTACTEMAIL]
	  ,PERSONUSERVALIDFROM VALIDFROM
	  ,PERSONUSERVALIDTO   VALIDTO
	  ,'initial' [PARTITION]
	  ,GETDATE() AS SYNCSTARTDATETIME
	  ,[RECID] = ROW_NUMBER() OVER ( ORDER BY [PRIMARYCONTACTEMAIL] DESC )
---select * 
FROM [dbo].[HcmWorkerStaging]
--where [FIRSTNAME]+'.'+LASTNAME ='Zwiad.Apkhazava'

END

--select * 
--		  FROM [hr].[stg_tblcdmworker] worker
--			left join [hr].[stg_tblcdmworkeraddress] workeraddress
--					on worker.cdm_workerid = workeraddress.cdm_workerid
--			left join [hr].[stg_tblcdmworkerpersonaldetail] workerperonaldetails
--					on workeraddress.cdm_workerid = workerperonaldetails.cdm_workerid
--			left join [hr].[mshr_hcmpersonalcontactpersonentity] hcmpersonalcontact
--					on  worker.cdm_workernumber= hcmpersonalcontact.[mshr_workerpersonnelnumber]
--where worker.cdm_FirstName+'.'+worker.cdm_LastName ='Zwiad.Apkhazava'


