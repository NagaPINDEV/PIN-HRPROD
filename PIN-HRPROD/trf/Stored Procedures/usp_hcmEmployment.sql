

CREATE PROCEDURE [trf].[usp_hcmEmployment]
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

		TRUNCATE TABLE [dbo].[HcmEmploymentStaging]


		INSERT INTO [dbo].[HcmEmploymentStaging]
		SELECT 
		 [DEFINITIONGROUP]='RPT'
		,[EXECUTIONID]='RPT-'+CAST(FORMAT(GETDATE(),'yyyymmddhhmmss-') AS nvarchar(max))+CAST(@ID AS nvarchar(max))
		,[ISSELECTED]=0
		,[TRANSFERSTATUS]=0
		,[DIMENSIONDISPLAYVALUE] = ISNULL(emp.cdm_dimensiondisplayvalue,0)
		,[REGULATORYESTABLISHMENTID] = ''
		,[WORKERTYPE]=emp.cdm_workertype
		,[LEGALENTITYID]=com.[cdm_companycode]
		,[EMPLOYMENTSTARTDATE]=emp.[cdm_employmentstartdate]
		,[EMPLOYMENTENDDATE]=CAST(ISNULL(emp.[cdm_employmentenddate],'2154-12-31 23:59:59.000') AS datetime)
		,[PERSONNELNUMBER]=worker.cdm_workernumber
		,[CALENDARID]='?'
		,[PARTITION]='initial'
		,[EXITTYPE_CUSTOM]=CASE WHEN emp.cdm_exittype_custom = '100000000' THEN 'Involuntary'
								WHEN emp.cdm_exittype_custom = '100000001' THEN 'Voluntary'
								WHEN emp.cdm_exittype_custom IS NULL THEN ''
							END 
		,[EXTENDEDPROBATIONEND_CUSTOM]=CAST(ISNULL(emp.[cdm_extendedprobationend_custom],'1900-01-01 00:00:00.000') AS datetime)
		,[LEAVINGREASON_CUSTOM]=
							ISNULL(CASE WHEN emp.[cdm_leavingreason_custom] = '100000000' THEN 'Career Change'
									WHEN emp.[cdm_leavingreason_custom]= '100000001' THEN 'Career Development'
									WHEN emp.[cdm_leavingreason_custom]= '100000002' THEN 'Commuting Distance'
									WHEN emp.[cdm_leavingreason_custom]= '100000003' THEN 'Company Culture'
									WHEN emp.[cdm_leavingreason_custom]= '100000004' THEN 'Compensation'
									WHEN emp.[cdm_leavingreason_custom]= '100000005' THEN 'Improved Work/Life Balance'
									WHEN emp.[cdm_leavingreason_custom]= '100000006' THEN 'Management'
									WHEN emp.[cdm_leavingreason_custom]= '100000007' THEN 'Not Suited for Role'
									WHEN emp.[cdm_leavingreason_custom]= '100000008' THEN 'Other'
									WHEN emp.[cdm_leavingreason_custom]= '100000009' THEN 'Personal Reasons'
									WHEN emp.[cdm_leavingreason_custom]= '100000010' THEN 'Redundancy'
									WHEN emp.[cdm_leavingreason_custom]= '100000011' THEN 'Relocation'
									WHEN emp.[cdm_leavingreason_custom]= '100000012' THEN 'Team/Brand'
									WHEN emp.[cdm_leavingreason_custom]= '100000013' THEN 'Termination'
									WHEN emp.[cdm_leavingreason_custom] IS NULL THEN ' '
								END ,'')
		
		,[LEAVINGREASONOTHER_CUSTOM]=ISNULL(emp.[cdm_leavingreasonother_custom],'N/A')
		,[ORIGPROBATIONENDDATE_CUSTOM]=CAST(ISNULL(emp.[cdm_origprobationenddate_custom],'1900-01-01 00:00:00.000') AS datetime)
		,[PROBATIONCOMPLETE_CUSTOM]=emp.[cdm_probationcomplete_custom]
		,[PROBATIONPASSEDDATE_CUSTOM]=CAST(ISNULL(emp.[cdm_probationpasseddate_custom],'1900-01-01 00:00:00.000') AS datetime)
		,[REHIRE_CUSTOM]=emp.[cdm_rehire_custom]
		,[PAYROLLID_CUSTOM]= ISNULL(cdm_payrollid_custom,'')
		,[SYNCSTARTDATETIME] = GETDATE()
		,[RECID] = ROW_NUMBER() OVER (  ORDER BY worker.cdm_workernumber  )
		--select emp.*
		FROM [hr].[stg_tblcdmemployment] emp
			inner join [hr].[stg_tblcdmcompany] com
				 on emp.cdm_companyid = com.[cdm_companyid]
			inner join [hr].[stg_tblcdmworker] worker 
				on  emp.[cdm_workerid] = worker.cdm_workerid
		--where worker.cdm_workernumber='E-000004'
		
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
				SELECT '[dbo].[HcmEmploymentStaging]',CAST(GETDATE() AS date),@startDate,@EndDate,@rowcount,ISNULL(@ErrorMessage,'No errors')
				COMMIT TRAN
END	
