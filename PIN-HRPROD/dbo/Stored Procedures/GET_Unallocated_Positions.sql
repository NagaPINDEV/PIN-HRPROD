
  CREATE PROCEDURE [dbo].[GET_Unallocated_Positions]
  AS
  SELECT 
  emp.Personnell_Number, pt.Title, man.POSITIONID, p.Placement_ID
  FROM [dbo].[Placement_Integrator] p
  INNER JOIN [dbo].[CFG_EmpNumber] emp on emp.Placement_ID = p.Placement_ID
  INNER JOIN [Placement_Transaction] pt on pt.Placment_Id = p.Placement_ID and pt.Is_Latest = 1
  LEFT JOIN (SELECT 
      Placement_ID,ManagerHRIS, LEFT(ManagerHRIS, CHARINDEX('@', ManagerHRIS) - 1) AS USERID, POSITIONID
	  FROM [dbo].[Placement_Transaction] pt
	  INNER JOIN Placement_Integrator p on p.Placement_ID = pt.Placment_Id
	  INNER JOIN [dbo].[HcmWorkerStaging] ws on ws.USER_ = LEFT(ManagerHRIS, CHARINDEX('@', ManagerHRIS) - 1)  COLLATE database_default
	  INNER JOIN HcmPositionV2Staging p2 on p2.WORKERPERSONNELNUMBER = ws.PERSONNELNUMBER
	  WHERE Is_Latest = 1 and Position_Assigned = 0
	  ) man on man.Placement_ID = p.Placement_ID
  WHERE Worker_Created = 1 AND Employment_Created = 1 And Position_Assigned = 0
  AND man.POSITIONID IS NOT NULL