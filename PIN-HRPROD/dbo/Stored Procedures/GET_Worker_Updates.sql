CREATE PROCEDURE [dbo].[GET_Worker_Updates]
AS

SELECT
		pt.[TS]
      ,pt.[Placment_Id]
      ,pt.[Vacancy_ID]
      ,pt.[Consultant_ID]
      ,pt.[Candidate_ID]
      ,pt.[Manager_Contact_ID]
      ,pt.[FirstName]
      ,pt.[LastName]
      ,pt.[Nickame]
      ,pt.[PersonalEmail]
      ,pt.[PersonalMobile]
      ,pt.[StartDate]
      ,pt.[EndDate]
      ,pt.[ClientName]
      ,pt.[ClientGuid]
      ,pt.[DOB]
      ,pt.[HRClientGUID]
      ,pt.[HRCompRegion]
      ,pt.[Office]
      ,pt.[Brand]
      ,pt.[Team]
      ,pt.[HKEY]
      ,pt.[Is_Latest]
	  ,emp.Personnell_Number
	  ,SharepointLocation
FROM [dbo].[Placement_Transaction] pt
INNER JOIN [dbo].[Placement_Integrator] pit on pit.Placement_ID = pt.Placment_Id
INNER JOIN [dbo].[CFG_EmpNumber] emp on emp.Placement_ID = pt.Placment_Id
WHERE pit.Worker_Created <= 1 and SuccesfullStart = 0
and Is_Latest = 1


