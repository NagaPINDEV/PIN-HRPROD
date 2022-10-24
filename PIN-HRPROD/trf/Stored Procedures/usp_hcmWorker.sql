--/****** Object:  StoredProcedure [trf].[usp_hcmWorker]    Script Date: 21/10/2022 14:42:04 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
CREATE PROCEDURE [trf].[usp_hcmWorker]
/*
-- =======================================================================================================================================
-- Author		:
-- Create Date	:  10/10/2022
-- Description	:  This process is to load the hcm worker entity -- full load
-- NOTE			:  anything changed here needs to be changed in the [trf].[usp_hcmWorker]
-- 11/10/2022   :  Audit mechanism around HCM worker Entity 
-- 12/10/2022   :  Change the Schema name from CTRL to AUDIT 
-- 
-- 
-- =======================================================================================================================================
*/
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
			
			TRUNCATE TABLE [dbo].[HcmWorkerStaging]
			
			INSERT INTO [dbo].[HcmWorkerStaging]
			SELECT [PRIMARYCONTACTEMAILPURPOSE],[PRIMARYCONTACTFAXPURPOSE],[PRIMARYCONTACTPHONEPURPOSE]
			      ,[PRIMARYCONTACTURLPURPOSE],[BIRTHDATE],[CITIZENSHIPCOUNTRYREGION]
			      ,[NATIONALITYCOUNTRYREGION],[DECEASEDDATE],[DISABLEDVERIFICATIONDATE]
			      ,[EDUCATION],[ETHNICORIGINID],[FATHERBIRTHCOUNTRYREGION],[GENDER],[ISDISABLED],[ISFULLTIMESTUDENT]
			      ,[MOTHERBIRTHCOUNTRYREGION],[NATIVELANGUAGEID],[PERSONBIRTHCOUNTRYREGION],[PERSONBIRTHCITY],[ISDISABLEDVETERAN]
			      ,[ISEXPATRIATERULINGAPPLICABLE],[EXPATRIATERULINGVALIDFROM],[EXPATRIATERULINGVALIDTO],[MARITALSTATUS],[NUMBEROFDEPENDENTS]
			      ,[MILITARYSERVICESTARTDATE],[MILITARYSERVICEENDDATE],[VETERANSTATUSID],[ADDRESSBOOKS],[ADDRESSPURPOSE],[PARTYTYPE],[ELECTRONICLOCATIONID]
			      ,[ADDRESSNAMEDESCRIPTION],[PRIMARYCONTACTFACEBOOKPURPOSE],[PRIMARYCONTACTLINKEDINPURPOSE],[PRIMARYCONTACTTWITTERPURPOSE],[WORKERTYPE],[WORKERSTATUS]
			      ,[PERSONALTITLE],[PERSONALSUFFIX],[ADDRESSCOUNTRYREGIONISOCODE],[OFFICELOCATION],[OBJECTID],[ALLOWREHIRE],[DEFINITIONGROUP],[EXECUTIONID],[ISSELECTED]
			      ,[TRANSFERSTATUS],[PERSONNELNUMBER],[PARTYNUMBER],[KNOWNAS],[LANGUAGEID],[NAME],[NAMEALIAS],[PHONETICFIRSTNAME],[PHONETICLASTNAME],[PHONETICMIDDLENAME]
			      ,[PRIMARYADDRESSLOCATION],[PRIMARYCONTACTEMAIL],[PRIMARYCONTACTEMAILDESCRIPTION],[PRIMARYCONTACTEMAILISIM],[PRIMARYCONTACTEMAILISPRIVATE]
			      ,[PRIMARYCONTACTFAX],[PRIMARYCONTACTFAXDESCRIPTION],[PRIMARYCONTACTFAXEXTENSION],[PRIMARYCONTACTFAXISPRIVATE],[PRIMARYCONTACTPHONE],[PRIMARYCONTACTPHONEDESCRIPTION]
			      ,[PRIMARYCONTACTPHONEEXTENSION],[PRIMARYCONTACTPHONEISMOBILE],[PRIMARYCONTACTPHONEISPRIVATE],[PRIMARYCONTACTURL],[PRIMARYCONTACTURLDESCRIPTION]
				  ,[PRIMARYCONTACTURLISPRIVATE],[PRIMARYCONTACTFACEBOOK],[PRIMARYCONTACTFACEBOOKDESCRIPTION],[PRIMARYCONTACTFACEBOOKISPRIVATE],[PRIMARYCONTACTLINKEDIN]
			      ,[PRIMARYCONTACTLINKEDINDESCRIPTION],[PRIMARYCONTACTLINKEDINISPRIVATE],[PRIMARYCONTACTTWITTER],[PRIMARYCONTACTTWITTERISPRIVATE]
			      ,[PRIMARYCONTACTTWITTERDESCRIPTION],[PROFESSIONALSUFFIX],[PROFESSIONALTITLE],[TITLEID],[ORIGINALHIREDATETIME],[SENIORITYDATE]
			      ,[ANNIVERSARYDATETIME],[OFFICELOCATIONID],[SUMMARYVALIDFROM],[SUMMARYVALIDTO],[PERSONDETAILSVALIDFROM],[PERSONDETAILSVALIDTO],[ADDRESSCITY]
			      ,[ADDRESSCOUNTRYREGIONID],[ADDRESSCOUNTY],[ADDRESSDISTRICTNAME],[ADDRESSLOCATIONID] ,[ADDRESSSTATE],[ADDRESSSTREET]
			      ,[ADDRESSZIPCODE],[ADDRESSVALIDFROM],[ADDRESSVALIDTO],[FIRSTNAME] ,[MIDDLENAME],[LASTNAMEPREFIX],[LASTNAME],[NAMESEQUENCEDISPLAYAS]
			      ,[WORKSFROMHOME],[ADDEDFIELDS],[PARTITION],[USER_],[PERSONUSERVALIDFROM],[PERSONUSERVALIDTO],[IDENTITYEMAIL],[IDENTITYPROVIDER]
			      ,[CAREERTRACK_CUSTOM],[ASSIGNMENTS_CUSTOM],[GENDEROTHER_CUSTOM],[MEDICAL_CUSTOM],[OTHERRELIGION_CUSTOM],[RELIGION_CUSTOM]
			      ,[SEXUALORIENTATIONOTHER_CUSTOM],[SEXUALORIENTATIONV2_CUSTOM],[EEOARMY_CUSTOM],[EEOCOLLEGE_CUSTOM],[EEOGENDER_CUSTOM]
			      ,[EEORACE_CUSTOM],[EEORELIGION_CUSTOM],[EEOSEXUALORIENTATION_CUSTOM],[EEOTRANS_CUSTOM],[LANGUAGESOTHER_CUSTOM],[RACEOTHER_CUSTOM]
			      ,[EEOCAREADULT_CUSTOM],[EEOCAREPOC_CUSTOM],[FEEEARNER_CUSTOM],[SYNCSTARTDATETIME]
			      ,[RECID] = ROW_NUMBER() OVER (ORDER BY dat.PERSONNELNUMBER)
			FROM (
			SELECT [PRIMARYCONTACTEMAILPURPOSE] =''
			      ,[PRIMARYCONTACTFAXPURPOSE]=''
			      ,[PRIMARYCONTACTPHONEPURPOSE]=''
			      ,[PRIMARYCONTACTURLPURPOSE]=''
			      ,[BIRTHDATE]= CAST(ISNULL(worker.cdm_Birthdate,'2154-01-01') AS datetime) 
			      ,[CITIZENSHIPCOUNTRYREGION]=CAST(ISNULL(workerperonaldetails.cdm_CitizenshipCountryRegion,'') AS nvarchar(50))
			      ,[NATIONALITYCOUNTRYREGION]=CAST(ISNULL(workerperonaldetails.cdm_NationalityCountryRegion,'') AS nvarchar(10))
			      ,[DECEASEDDATE]= CAST('1900-01-01 00:00:00' AS datetime)
			      ,[DISABLEDVERIFICATIONDATE]= CAST('1900-01-01 00:00:00' AS datetime)
			      ,[EDUCATION]=''
			      ,[ETHNICORIGINID]='01'
			      ,[FATHERBIRTHCOUNTRYREGION]=''
			      ,[GENDER]= CAST(
								CASE 
								  WHEN worker.cdm_gender='754400002' THEN '0'
								  WHEN worker.cdm_gender='754400000' THEN '1'
								  WHEN worker.cdm_gender='754400001' THEN '2'
								  WHEN worker.cdm_gender='754400003' THEN '3'
								  WHEN worker.cdm_gender IS NULL THEN ''
								END
								 AS INT)
								
			      ,[ISDISABLED]=0
			      ,[ISFULLTIMESTUDENT]=0
			      ,[MOTHERBIRTHCOUNTRYREGION]=''
			      ,[NATIVELANGUAGEID]=''
			      ,[PERSONBIRTHCOUNTRYREGION]=''
			      ,[PERSONBIRTHCITY]=''
			      ,[ISDISABLEDVETERAN]=0
			      ,[ISEXPATRIATERULINGAPPLICABLE]=0
			      ,[EXPATRIATERULINGVALIDFROM]=CAST('1900-01-01 00:00:00' AS datetime)
			      ,[EXPATRIATERULINGVALIDTO]=CAST('1900-01-01 00:00:00' AS datetime)
			      ,[MARITALSTATUS]=ISNULL(workerperonaldetails.cdm_MaritalStatus,0)
			      ,[NUMBEROFDEPENDENTS]=ISNULL(workerperonaldetails.cdm_NumberOfDependents,0)
				      ,[MILITARYSERVICESTARTDATE]=CAST('1900-01-01 00:00:00' AS datetime)
				  ,[MILITARYSERVICEENDDATE]=CAST('1900-01-01 00:00:00' AS datetime)
				  ,[VETERANSTATUSID]=''
				  ,[ADDRESSBOOKS]=''
				  ,[ADDRESSPURPOSE]=ISNULL(workeraddress.cdm_AddressType,'')
				  ,[PARTYTYPE]=''
				  ,[ELECTRONICLOCATIONID]=''
				  ,[ADDRESSNAMEDESCRIPTION]=ISNULL(workeraddress.cdm_Description,'')
				  ,[PRIMARYCONTACTFACEBOOKPURPOSE]=''
				  ,[PRIMARYCONTACTLINKEDINPURPOSE]=''
				  ,[PRIMARYCONTACTTWITTERPURPOSE]=''
				  ,[WORKERTYPE]=ISNULL(CAST(CASE WHEN worker.cdm_Type='754400000'  THEN 1 
									 WHEN worker.cdm_Type IS NULL THEN 2 
							    END  AS int),0)
				  ,[WORKERSTATUS]=ISNULL(CAST (CASE WHEN worker.cdm_Status IS NULL THEN 1
										WHEN worker.cdm_Status='754400001' THEN 2 
								END AS int),0)
				  ,[PERSONALTITLE]=''
				  ,[PERSONALSUFFIX]=''
				  ,[ADDRESSCOUNTRYREGIONISOCODE]=''
				  ,[OFFICELOCATION]=''
				  ,[OBJECTID]=NEWID()
				  ,[ALLOWREHIRE]=''
				  ,[DEFINITIONGROUP]='RPT'
				  ,[EXECUTIONID]='RPT-'+CAST(FORMAT(GETDATE(),'yyyymmddhhmmss-') AS nvarchar(max))+CAST(@ID AS nvarchar(max))
				  ,[ISSELECTED]=0
				  ,[TRANSFERSTATUS]=0
				  ,[PERSONNELNUMBER]=worker.cdm_workernumber
				  ,[PARTYNUMBER]=ISNULL(hcmworker.mshr_partynumber,0)
				  ,[KNOWNAS]=ISNULL(worker.cdm_knownas,'')
				  ,[LANGUAGEID]=ISNULL(worker.cdm_LanguageId,0)
				  ,[NAME]=ISNULL(worker.[cdm_fullname],'')--ISNULL(worker.cdm_knownas,'')
				  ,[NAMEALIAS]=ISNULL(LEFT(worker.cdm_knownas,20),'')
				  ,[PHONETICFIRSTNAME]=''
				  ,[PHONETICLASTNAME]=''
				  ,[PHONETICMIDDLENAME]=''
				  ,[PRIMARYADDRESSLOCATION]=''
				  ,[PRIMARYCONTACTEMAIL]=ISNULL(worker.cdm_primaryemailaddress,'')
				  ,[PRIMARYCONTACTEMAILDESCRIPTION]=''
				  ,[PRIMARYCONTACTEMAILISIM]=''
				  ,[PRIMARYCONTACTEMAILISPRIVATE]=''
				  ,[PRIMARYCONTACTFAX]=''
				  ,[PRIMARYCONTACTFAXDESCRIPTION]=''
				  ,[PRIMARYCONTACTFAXEXTENSION]=''
				  ,[PRIMARYCONTACTFAXISPRIVATE]=''
				  ,[PRIMARYCONTACTPHONE]=''
				  ,[PRIMARYCONTACTPHONEDESCRIPTION]=''
				  ,[PRIMARYCONTACTPHONEEXTENSION]=''
				  ,[PRIMARYCONTACTPHONEISMOBILE]=''
				  ,[PRIMARYCONTACTPHONEISPRIVATE]=''
				  ,[PRIMARYCONTACTURL]=''
				  ,[PRIMARYCONTACTURLDESCRIPTION]=''
				  ,[PRIMARYCONTACTURLISPRIVATE]=''
				  ,[PRIMARYCONTACTFACEBOOK]=''
				  ,[PRIMARYCONTACTFACEBOOKDESCRIPTION]=''
				  ,[PRIMARYCONTACTFACEBOOKISPRIVATE]=''
				  ,[PRIMARYCONTACTLINKEDIN]=''
				  ,[PRIMARYCONTACTLINKEDINDESCRIPTION]=''
				  ,[PRIMARYCONTACTLINKEDINISPRIVATE]=''
				  ,[PRIMARYCONTACTTWITTER]=''
				  ,[PRIMARYCONTACTTWITTERISPRIVATE]=''
				  ,[PRIMARYCONTACTTWITTERDESCRIPTION]=''
				  ,[PROFESSIONALSUFFIX]=''
				  ,[PROFESSIONALTITLE]=''
				  ,[TITLEID]=''
				  ,[ORIGINALHIREDATETIME]=worker.cdm_originalhiredatetime
				  ,[SENIORITYDATE]= ISNULL(worker.cdm_senioritydate,'2154-01-01 23:59:59:000')
				  ,[ANNIVERSARYDATETIME]=''
				  ,[OFFICELOCATIONID]=''
				  ,[SUMMARYVALIDFROM]=ISNULL(worker.createdon,'')
				  ,[SUMMARYVALIDTO]='2154-01-01 23:59:59:000'
				  ,[PERSONDETAILSVALIDFROM]=ISNULL(worker.modifiedon,'')
				  ,[PERSONDETAILSVALIDTO]='2154-01-01 23:59:59:000'
				  ,[ADDRESSCITY]=ISNULL(workeraddress.cdm_City,'')
				  ,[ADDRESSCOUNTRYREGIONID]=ISNULL(workeraddress.cdm_CountryRegion,'')
				  ,[ADDRESSCOUNTY]=ISNULL(workeraddress.cdm_County,'')
				  ,[ADDRESSDISTRICTNAME]=ISNULL(workeraddress.cdm_StateOrProvince,'')
				  ,[ADDRESSLOCATIONID]=''
				  ,[ADDRESSSTATE]=ISNULL(workeraddress.cdm_StateOrProvince,'')
				  ,[ADDRESSSTREET]=ISNULL(workeraddress.cdm_Street,'')
				  ,[ADDRESSZIPCODE]=ISNULL(workeraddress.cdm_PostalCode,'')
				  ,[ADDRESSVALIDFROM]=''
				  ,[ADDRESSVALIDTO]=''
				  ,[FIRSTNAME]=worker.cdm_FirstName
				  ,[MIDDLENAME]=ISNULL(worker.cdm_MiddleName,'')
				  ,[LASTNAMEPREFIX]=''
				  ,[LASTNAME]=worker.cdm_LastName
				  ,[NAMESEQUENCEDISPLAYAS]=worker.cdm_namesequencedisplayas
				  ,[WORKSFROMHOME]=worker.cdm_WorksFromHome
				  ,[ADDEDFIELDS]=''
				  ,[PARTITION]='initial'
				  ,[USER_]=ISNULL(hcmworker.mshr_user,'')
				  ,[PERSONUSERVALIDFROM]=''
				  ,[PERSONUSERVALIDTO]=''
				  ,[IDENTITYEMAIL]=ISNULL(hcmworker.mshr_identityemail,'')
				  ,[IDENTITYPROVIDER]=''
				  ,[CAREERTRACK_CUSTOM]=''
				  ,[ASSIGNMENTS_CUSTOM]=ISNULL(worker.cdm_Assignments_Custom,'')
				  ,[GENDEROTHER_CUSTOM]=ISNULL(worker.cdm_GenderOther_Custom,'')
				  ,[MEDICAL_CUSTOM]=''--worker.cdm_Medical_Custom
				  ,[OTHERRELIGION_CUSTOM]= ISNULL(worker.cdm_OtherReligion_Custom,'')
				  ,[RELIGION_CUSTOM]=''
				  ,[SEXUALORIENTATIONOTHER_CUSTOM]=ISNULL(worker.cdm_SexualOrientationOther_Custom,'')
				  ,[SEXUALORIENTATIONV2_CUSTOM]=ISNULL(
														 CASE WHEN worker.cdm_SexualOrientationv2_Custom='100000001' THEN 'Bisexual'
															  WHEN worker.cdm_SexualOrientationv2_Custom='100000002' THEN 'Gay'
															  WHEN worker.cdm_SexualOrientationv2_Custom='100000003' THEN 'Heterosexual'
															  WHEN worker.cdm_SexualOrientationv2_Custom='100000004' THEN 'Lesbian'
															  WHEN worker.cdm_SexualOrientationv2_Custom='100000007' THEN 'Prefer Not to Say'
															  ELSE ''
														 END 
													 ,'')
				  ,[EEOARMY_CUSTOM]=ISNULL(worker.cdm_EEOArmy_Custom,'')
				  ,[EEOCOLLEGE_CUSTOM]=ISNULL(worker.cdm_EEOCollege_Custom,'')
				  ,[EEOGENDER_CUSTOM]=ISNULL(worker.cdm_EEOGender_Custom,'')
				  ,[EEORACE_CUSTOM]=ISNULL(worker.cdm_EEORace_Custom,'')
				  ,[EEORELIGION_CUSTOM]=ISNULL(worker.cdm_EEOReligion_Custom,'')
				  ,[EEOSEXUALORIENTATION_CUSTOM]=ISNULL(worker.cdm_EEOSexualOrientation_Custom,'')
				  ,[EEOTRANS_CUSTOM]=ISNULL(worker.cdm_EEOTrans_Custom,'')
				  ,[LANGUAGESOTHER_CUSTOM]=ISNULL(worker.cdm_LanguagesOther_Custom,'')
				  ,[RACEOTHER_CUSTOM]=ISNULL(worker.cdm_RaceOther_Custom,'')
				  ,[EEOCAREADULT_CUSTOM]=ISNULL(worker.cdm_EEOCareAdult_Custom,'')
				  ,[EEOCAREPOC_CUSTOM]=ISNULL(worker.cdm_EEOCarePoC_Custom,'')
				  ,[FEEEARNER_CUSTOM]=ISNULL(worker.cdm_FeeEarner_Custom,'')
				  ,[SYNCSTARTDATETIME]= GETDATE()
				  ,[RECID]= ROW_NUMBER() OVER ( PARTITION BY worker.cdm_workernumber ORDER BY worker.cdm_workernumber)
				--INTO HcmWorkerStaging_TEST
				--select * 
				FROM [hr].[stg_tblcdmworker] worker
					left join [hr].[stg_tblcdmworkeraddress] workeraddress
							on worker.cdm_workerid = workeraddress.cdm_workerid
					left join [hr].[stg_tblcdmworkerpersonaldetail] workerperonaldetails
							on workeraddress.cdm_workerid = workerperonaldetails.cdm_workerid
					left join [hr].[mshr_hcmpersonalcontactpersonentity] hcmpersonalcontact
							on  worker.cdm_workernumber= hcmpersonalcontact.[mshr_workerpersonnelnumber]
					left join [hr].[mshr_hcmworker] hcmworker
							on hcmworker.mshr_personnelnumber  = worker.cdm_workernumber
				--where worker.cdm_FirstName+'.'+worker.cdm_LastName ='Zwiad.Apkhazava'
				) dat where  dat.RECID=1
		
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
		SELECT '[dbo].[HcmWorkerStaging]',CAST(GETDATE() AS date),@startDate,@EndDate,@rowcount,ISNULL(@ErrorMessage,'No errors')
		COMMIT TRAN
END


