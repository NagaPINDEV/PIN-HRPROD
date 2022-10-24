﻿CREATE procedure [dbo].[Proc_Staff_Sheet_New]
  As 
  Begin
  ;With A as 
		(
		SELECT DISTINCT
				  w.PERSONNELNUMBER
				, w.PARTYNUMBER
				, ws.USEREMAIL
				, w.NAME
				, MIN(e.EMPLOYMENTSTARTDATE) AS SD
				, MAX(e.EMPLOYMENTENDDATE) AS ED
				, case when year( MAX(e.EMPLOYMENTENDDATE))= '2154' THEN (case when (datediff(day, Min(e.EMPLOYMENTENDDATE),Max(e.EMPLOYMENTSTARTDATE))>=30) THEN (datediff(day,max(e.EMPLOYMENTSTARTDATE),getdate())/365)
																			ELSE (datediff(day,min(e.EMPLOYMENTSTARTDATE),getdate())/365) END )
						ELSE (datediff(day,min(e.EMPLOYMENTSTARTDATE),Min(e.EMPLOYMENTENDDATE))/365) END  as LOS
				, min(e.EMPLOYMENTSTARTDATE) as Originalhire
				, case WHEN min(EMPLOYMENTSTARTDATE)!=MAX(EMPLOYMENTSTARTDATE) Then MAX(EMPLOYMENTSTARTDATE)
							ELSE min(EMPLOYMENTSTARTDATE) END as Latesthire
				, em.LEGALENTITYID
				, p.OFFICE_CUSTOM
				, p.TEAMV2_CUSTOM AS TEAM_CUSTOM
				--,p.FUNCTION_CUSTOM
				, s.PERSONNELNUMBER as MNGR_HRIS_ID
				, p.WORKERASSIGNMENTEND
				, p.WORKERASSIGNMENTSTART
				, CASE WHEN DAY(MAX(e.EMPLOYMENTENDDATE))>14 THEN CASE WHEN MONTH(MAX(e.EMPLOYMENTENDDATE)) = 12 THEN DATEFROMPARTS((YEAR(MAX(e.EMPLOYMENTENDDATE))+1),1,27)
																	ELSE DATEFROMPARTS(YEAR(MAX(e.EMPLOYMENTENDDATE)),(MONTH(MAX(e.EMPLOYMENTENDDATE))+1),27) END
						ELSE DATEFROMPARTS(YEAR(MAX(e.EMPLOYMENTENDDATE)),MONTH(MAX(e.EMPLOYMENTENDDATE)),27) END AS PED
				, p.POSITIONID
				, p.JOBID AS JOBTITLE
				, p.TITLEID as Functional_Title
				, w.OFFICELOCATION
				, w.BIRTHDATE
				, phs.PARENTPOSITIONID
				, d.NAME AS HRIS_Department
				, p.DEPARTMENTNUMBER
		FROM  [dbo].HcmWorkerStaging w
		LEFT JOIN [dbo].DirPersonUserStaging ws 
				ON w.PERSONNELNUMBER COLLATE DATABASE_DEFAULT = ws.PERSONNELNUMBER COLLATE DATABASE_DEFAULT
		LEFT JOIN 
				(
				SELECT DISTINCT
					  pw.PERSONNELNUMBER
					, CASE WHEN pp.POSITIONID IS NULL THEN npp.POSITIONID 
						ELSE pp.POSITIONID END AS POSITIONID
				FROM HcmPositionWorkerAssignmentV2Staging pw
					LEFT JOIN (
								SELECT * FROM [dbo].HcmPositionWorkerAssignmentV2Staging 
								WHERE ISPRIMARYPOSITION = 1
							  ) pp 
							  ON pp.PERSONNELNUMBER = pw.PERSONNELNUMBER
					LEFT JOIN (
								SELECT  pw.PERSONNELNUMBER
									  , pw.POSITIONID
								FROM [dbo].HcmPositionWorkerAssignmentV2Staging pw
								INNER JOIN 
										(SELECT PERSONNELNUMBER
											  , MAX(VALIDTO) AS jd 
										 FROM [dbo].HcmPositionWorkerAssignmentV2Staging mp 
										 GROUP BY PERSONNELNUMBER
										) p ON p.jd = pw.VALIDTO 
											AND p.PERSONNELNUMBER = pw.PERSONNELNUMBER
							 ) npp ON npp.PERSONNELNUMBER = pw.PERSONNELNUMBER 
			) ps ON ps.PERSONNELNUMBER = w.PERSONNELNUMBER
		LEFT JOIN  [dbo].HcmPositionV2Staging    p 
				ON p.POSITIONID = ps.POSITIONID
		LEFT JOIN [dbo].HcmEmploymentStaging e 
				ON w.PERSONNELNUMBER = e.PERSONNELNUMBER
		LEFT JOIN     
				(
				 select h.PERSONNELNUMBER
					  , MAX(h.EMPLOYMENTENDDATE) as ED
					  , h.LEGALENTITYID 
				 from HcmEmploymentStaging h
				 INNER JOIN (
							select   s.PERSONNELNUMBER
									,MAX(s.EMPLOYMENTENDDATE) as ED 
							from HcmEmploymentStaging s
							group by PERSONNELNUMBER
							) p on h.PERSONNELNUMBER=p.PERSONNELNUMBER 
									AND ED=h.EMPLOYMENTENDDATE
				group by h.PERSONNELNUMBER
						,h.LEGALENTITYID
				) em on  em.PERSONNELNUMBER=w.PERSONNELNUMBER
		Left JOIN 
				(
				select p.POSITIONID
					 , p.PARENTPOSITIONID
					 , h.PERSONNELNUMBER 
				from [dbo].[HcmPositionHierarchyStaging] p
				left join HcmPositionWorkerAssignmentV2Staging h
					on h.POSITIONID= p.PARENTPOSITIONID
				INNER JOIN 
						(SELECT 
								  POSITIONID
								, MAX(VALIDTO) AS jd 
						 FROM [dbo].[HcmPositionHierarchyStaging] 
						 GROUP BY POSITIONID
						) md 
							ON md.POSITIONID = p.POSITIONID 
								AND md.jd = p.VALIDTO
				)		phs ON p.POSITIONID = phs.POSITIONID
		LEFT JOIN OMDepartmentStaging d 
				on d.OPERATINGUNITNUMBER = p.DEPARTMENTNUMBER
		LEFT JOIN HcmPositionWorkerAssignmentV2Staging  s 
				on s.POSITIONID=phs.PARENTPOSITIONID 
						AND s.ISPRIMARYPOSITION = 1
		--p.POSITIONID <> 'P-900148' and p.WORKERPERSONNELNUMBER NOT IN ('E-900163','E-003506','E-003575')-- AND WORKERPERSONNELNUMBER <> 'E-900297'
		GROUP BY w.PERSONNELNUMBER, w.PARTYNUMBER, ws.USEREMAIL,p.POSITIONID,w.NAME,p.JOBID,w.OFFICELOCATION,
				 w.BIRTHDATE,phs.PARENTPOSITIONID,p.OFFICE_CUSTOM,p.TEAMV2_CUSTOM,--p.FUNCTION_CUSTOM,
			     p.WORKERASSIGNMENTEND,p.WORKERASSIGNMENTSTART,p.TITLEID, d.NAME,p.DEPARTMENTNUMBER,s.PERSONNELNUMBER,em.LEGALENTITYID
	) ,B as (Select distinct a.* 
			  	   ,case when a.NAME = 'James Youtan' then 'CEO' else b.NAME END  as Manager_Name
						 , b.USEREMAIL as Manager_email
						 , b.JOBTITLE As Manager_JOB_TITLE   
			from A a
			LEFT join A b ON b.POSITIONID=a.PARENTPOSITIONID
			)
MERGE staffsheet AS TARGET
USING B AS SOURCE
ON TARGET.PERSONNELNUMBER = SOURCE.PERSONNELNUMBER
--When records are matched, update the records if there is any change
WHEN MATCHED THEN 
	UPDATE
		SET   TARGET.PARTYNUMBER = SOURCE.PARTYNUMBER  
			, TARGET.USEREMAIL = SOURCE.USEREMAIL
			, TARGET.SD = SOURCE.SD
			, TARGET.ED = SOURCE.ED
			, TARGET.PED = SOURCE.PED
			, TARGET.NAME = SOURCE.NAME
			, TARGET.POSITIONID = SOURCE.POSITIONID
			, TARGET.JOBTITLE = SOURCE.JOBTITLE
			, TARGET.OFFICELOCATION = SOURCE.OFFICELOCATION
			, TARGET.BIRTHDATE = SOURCE.BIRTHDATE
			, TARGET.PARENTPOSITIONID = SOURCE.PARENTPOSITIONID
			, TARGET.Manager_Name =SOURCE.Manager_Name
			, TARGET.Manager_email = SOURCE.Manager_email
			, TARGET.Manager_JOB_TITLE = SOURCE.Manager_JOB_TITLE
			, TARGET.OFFICE_CUSTOM = SOURCE.OFFICE_CUSTOM
			, TARGET.TEAM_CUSTOM = SOURCE.TEAM_CUSTOM
			--,TARGET.FUNCTION_CUSTOM = SOURCE.FUNCTION_CUSTOM
			, TARGET.Functional_Title =SOURCE.Functional_Title
			, TARGET.[DEPARTMENTNUMBER]=SOURCE.[DEPARTMENTNUMBER]
			, TARGET.Dept_Name = SOURCE.HRIS_Department
			, TARGET.LOS=SOURCE.LOS
			, TARGET.Originalhire=SOURCE.Originalhire
			, TARGET.Latestdate=SOURCE.Latesthire
			, TARGET.MNGR_HRIS_ID=SOURCE.MNGR_HRIS_ID
			, TARGET.LEGALENTITY=SOURCE.LEGALENTITYID
			, TARGET.Action = 'Update' 
			, TARGET.Action_Date = GETDATE()
WHEN NOT MATCHED BY TARGET THEN 
		INSERT (	  PERSONNELNUMBER
				   ,  PARTYNUMBER  
					, USEREMAIL
					, SD
					, ED
					, PED
					, NAME
					, POSITIONID
					, JOBTITLE
					, OFFICELOCATION
					, BIRTHDATE
					, PARENTPOSITIONID
					, Manager_Name
					, Manager_email
					, Manager_JOB_TITLE
					, OFFICE_CUSTOM
					,TEAM_CUSTOM
				   --,FUNCTION_CUSTOM
					,Functional_Title
					,[Action]
					,Action_Date
					,DEPARTMENTNUMBER
					,Dept_Name
					,LOS
					,Originalhire
					,Latestdate
					,MNGR_HRIS_ID
					,LEGALENTITY
					) 
					VALUES (
					  SOURCE.PERSONNELNUMBER
					, SOURCE.PARTYNUMBER  
					, SOURCE.USEREMAIL
					, SOURCE.SD
					, SOURCE.ED
					, SOURCE.PED
					, SOURCE.NAME
					, SOURCE.POSITIONID
					, SOURCE.JOBTITLE
					, SOURCE.OFFICELOCATION
					, SOURCE.BIRTHDATE
					, SOURCE.PARENTPOSITIONID
					, SOURCE.Manager_Name
					, SOURCE.Manager_email
					, SOURCE.Manager_JOB_TITLE
					, SOURCE.OFFICE_CUSTOM
					, SOURCE.TEAM_CUSTOM
				  --,SOURCE.FUNCTION_CUSTOM
					, SOURCE.Functional_Title
					, 'Insert'
					, GETDATE()
					, SOURCE.[DEPARTMENTNUMBER]
					, SOURCE.HRIS_Department
					, SOURCE.LOS
					, SOURCE.Originalhire
					, SOURCE.Latesthire
					, SOURCE.MNGR_HRIS_ID
					, SOURCE.LEGALENTITYID
					)
WHEN NOT MATCHED BY SOURCE
THEN UPDATE SET Action = 'Delete', Action_Date = GETDATE() ;

UPDATE staffsheet
	SET 
		 staffsheet.SD=Addr.SD
		,staffsheet.ED=Addr.ED
		,staffsheet.PED=Addr.PED
FROM  staffsheet
	INNER JOIN
			(SELECT   PERSONNELNUMBER 
					, MIN(e.EMPLOYMENTSTARTDATE) AS SD
					, MAX(e.EMPLOYMENTENDDATE) AS ED
					, CASE	WHEN DAY(MAX(e.EMPLOYMENTENDDATE))>14 THEN CASE WHEN MONTH(MAX(e.EMPLOYMENTENDDATE)) = 12 THEN DATEFROMPARTS((YEAR(MAX(e.EMPLOYMENTENDDATE))+1),1,27)
																			ELSE DATEFROMPARTS(YEAR(MAX(e.EMPLOYMENTENDDATE)),(MONTH(MAX(e.EMPLOYMENTENDDATE))+1),27) END
							ELSE DATEFROMPARTS(YEAR(MAX(e.EMPLOYMENTENDDATE)),MONTH(MAX(e.EMPLOYMENTENDDATE)),27) END AS PED
			 FROM [dbo].HcmEmploymentStaging e WHERE  PERSONNELNUMBER IN
						(
						select  PERSONNELNUMBER 
						from staffsheet 
						where Action = 'Delete'  
							and Action_Date =cast(getdate() as date)
						) Group by PERSONNELNUMBER 
			) Addr ON staffsheet.PERSONNELNUMBER= Addr.PERSONNELNUMBER
End
