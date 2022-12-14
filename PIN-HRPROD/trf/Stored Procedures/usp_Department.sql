CREATE PROCEDURE [trf].[usp_Department]
/*
-- =======================================================================================================================================
-- Author		:
-- Create Date	:  18/10/2022
-- Description	:  This process is to load the department entity -- full load
-- NOTE			:  anything changed here needs to be changed in the [trf].[usp_Department]
-- 
-- 
-- =======================================================================================================================================
*/
AS 
BEGIN

DECLARE @ID AS uniqueIdentifier
SET @ID = NEWID()

  TRUNCATE TABLE [dbo].[OMDepartmentStaging]

  INSERT INTO [dbo].[OMDepartmentStaging]
  SELECT  
	   [DEFINITIONGROUP]
      ,[EXECUTIONID]
      ,[ISSELECTED]
      ,[TRANSFERSTATUS]
      ,[PARTYTYPE]
      ,[KNOWNAS]
      ,[LANGUAGE]
      ,[NAME]
      ,[MEMO]
      ,[SEARCHNAME]
      ,[PARTYNUMBER]
      ,[ORGANIZATIONTYPE]
      ,[OPERATINGUNITNUMBER]
      ,[OPERATINGUNITTYPES]
      ,[PRIMARYADDRESSCOUNTRYREGIONID]
      ,[PRIMARYADDRESSCOUNTRYREGIONISOCODE]
      ,[PRIMARYADDRESSCOUNTY]
      ,[PRIMARYADDRESSCITY]
      ,[PRIMARYADDRESSDESCRIPTION]
      ,[PRIMARYADDRESSVALIDFROM]
      ,[PRIMARYADDRESSVALIDTO]
      ,[PRIMARYADDRESSZIPCODE]
      ,[PRIMARYADDRESSSTATE]
      ,[PRIMARYADDRESSSTREET]
      ,[PRIMARYCONTACTEMAIL]
      ,[PRIMARYCONTACTEMAILISIM]
      ,[PRIMARYCONTACTFAX]
      ,[PRIMARYCONTACTPHONE]
      ,[PRIMARYCONTACTPHONEEXTENSION]
      ,[PRIMARYCONTACTPHONEISMOBILE]
      ,[PRIMARYCONTACTTELEX]
      ,[PRIMARYCONTACTURL]
      ,[ADDRESSLOCATIONROLES]
      ,[PRIMARYCONTACTPHONEPURPOSE]
      ,[PRIMARYCONTACTFAXPURPOSE]
      ,[PRIMARYCONTACTEMAILPURPOSE]
      ,[PRIMARYCONTACTTELEXPURPOSE]
      ,[PRIMARYCONTACTURLPURPOSE]
      ,[PRIMARYCONTACTEMAILDESCRIPTION]
      ,[PRIMARYCONTACTFAXDESCRIPTION]
      ,[PRIMARYCONTACTFAXEXTENSION]
      ,[PRIMARYCONTACTPHONEDESCRIPTION]
      ,[PRIMARYCONTACTTELEXDESCRIPTION]
      ,[PRIMARYCONTACTURLDESCRIPTION]
      ,[PRIMARYCONTACTFACEBOOKPURPOSE]
      ,[PRIMARYCONTACTFACEBOOKISPRIVATE]
      ,[PRIMARYCONTACTFACEBOOKDESCRIPTION]
      ,[PRIMARYCONTACTFACEBOOK]
      ,[PRIMARYCONTACTTWITTERPURPOSE]
      ,[PRIMARYCONTACTTWITTERISPRIVATE]
      ,[PRIMARYCONTACTTWITTERDESCRIPTION]
      ,[PRIMARYCONTACTTWITTER]
      ,[PRIMARYCONTACTLINKEDINPURPOSE]
      ,[PRIMARYCONTACTLINKEDINISPRIVATE]
      ,[PRIMARYCONTACTLINKEDINDESCRIPTION]
      ,[PRIMARYCONTACTLINKEDIN]
      ,[PARTITION]
      ,[SYNCSTARTDATETIME]
	  ,[RECID] = ROW_NUMBER() OVER (ORDER BY dat.[NAME]  )
  FROM(
		select [DEFINITIONGROUP]='RPT'
			  ,[EXECUTIONID]='RPT-'+CAST(FORMAT(GETDATE(),'yyyymmddhhmmss-') AS nvarchar(max))+CAST(@ID AS nvarchar(max))
		      ,[ISSELECTED]=0
		      ,[TRANSFERSTATUS]=0
		      ,[PARTYTYPE]='OperatingUnit'
		      ,[KNOWNAS]=''
		      ,[LANGUAGE]=''
		      ,[NAME]= cdm_name
		      ,[MEMO]=''
		      ,[SEARCHNAME]= left(cdm_name,20)
		      ,[PARTYNUMBER]=''
		      ,[ORGANIZATIONTYPE]=2
		      ,[OPERATINGUNITNUMBER]=cdm_departmentnumber
			  ,[OPERATINGUNITTYPES]=1
		      ,[PRIMARYADDRESSCOUNTRYREGIONID]=''
		      ,[PRIMARYADDRESSCOUNTRYREGIONISOCODE]=''
		      ,[PRIMARYADDRESSCOUNTY]=''
		      ,[PRIMARYADDRESSCITY]=''
		      ,[PRIMARYADDRESSDESCRIPTION]=''
		      ,[PRIMARYADDRESSVALIDFROM]=''
		      ,[PRIMARYADDRESSVALIDTO]=''
		      ,[PRIMARYADDRESSZIPCODE]=''
		      ,[PRIMARYADDRESSSTATE]=''
		      ,[PRIMARYADDRESSSTREET]=''
		      ,[PRIMARYCONTACTEMAIL]=''
		      ,[PRIMARYCONTACTEMAILISIM]=0
		      ,[PRIMARYCONTACTFAX]=''
		      ,[PRIMARYCONTACTPHONE]=''
		      ,[PRIMARYCONTACTPHONEEXTENSION]=''
		      ,[PRIMARYCONTACTPHONEISMOBILE]=0
		      ,[PRIMARYCONTACTTELEX]=''
		      ,[PRIMARYCONTACTURL]=''
		      ,[ADDRESSLOCATIONROLES]=''
		      ,[PRIMARYCONTACTPHONEPURPOSE]=''
		      ,[PRIMARYCONTACTFAXPURPOSE]=''
		      ,[PRIMARYCONTACTEMAILPURPOSE]=''
		      ,[PRIMARYCONTACTTELEXPURPOSE]=''
		      ,[PRIMARYCONTACTURLPURPOSE]=''
		      ,[PRIMARYCONTACTEMAILDESCRIPTION]=''
		      ,[PRIMARYCONTACTFAXDESCRIPTION]=''
		      ,[PRIMARYCONTACTFAXEXTENSION]=''
		      ,[PRIMARYCONTACTPHONEDESCRIPTION]=''
		      ,[PRIMARYCONTACTTELEXDESCRIPTION]=''
		      ,[PRIMARYCONTACTURLDESCRIPTION]=''
		      ,[PRIMARYCONTACTFACEBOOKPURPOSE]=''
		      ,[PRIMARYCONTACTFACEBOOKISPRIVATE]=0
		      ,[PRIMARYCONTACTFACEBOOKDESCRIPTION]=''
		      ,[PRIMARYCONTACTFACEBOOK]=''
		      ,[PRIMARYCONTACTTWITTERPURPOSE]=''
		      ,[PRIMARYCONTACTTWITTERISPRIVATE]=0
		      ,[PRIMARYCONTACTTWITTERDESCRIPTION]=''
		      ,[PRIMARYCONTACTTWITTER]=''
		      ,[PRIMARYCONTACTLINKEDINPURPOSE]=''
		      ,[PRIMARYCONTACTLINKEDINISPRIVATE]=0
		      ,[PRIMARYCONTACTLINKEDINDESCRIPTION]=''
		      ,[PRIMARYCONTACTLINKEDIN]=''
		      ,[PARTITION]= 'initial'
		      ,[SYNCSTARTDATETIME]= GETDATE()
		      ,[RN] = ROW_NUMBER() OVER (PARTITION BY cdm_name ORDER BY cdm_name)
		--select cdm_departmentnumber,count(*) 
		 from hr.stg_tblcdmdepartment
		 --WHERE cdm_name='Selby Jennings'
		 --group by cdm_departmentnumber
		 --HAVING COUNT(*)>1
	) dat
 WHERE dat.RN= 1
	--and dat.EXECUTIONID='RPT-20224418034406-E9279563-CFFF-4756-A06B-433DB6B9D950'
END

