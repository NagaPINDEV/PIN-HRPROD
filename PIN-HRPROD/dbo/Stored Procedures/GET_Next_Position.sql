
CREATE PROCEDURE [dbo].[GET_Next_Position]
(@Employee nvarchar(255), @Job nvarchar(255))
AS
UPDATE [CFG_EmpNumber]
SET PositionID = E.POSITIONID
FROM
(
SELECT TOP 1 P2.POSITIONID FROM [HcmPositionV2Staging] P2
INNER JOIN Title_to_Job_ID  JT On JT.JOBID_HRIS = JOBID COLLATE Database_Default
LEFT JOIN (SELECT CE.PositionID FROM [CFG_EmpNumber] CE) USED on USED.PositionID = P2.POSITIONID Collate Database_Default
WHERE 
WORKERPERSONNELNUMBER =''
AND
Job_Title_Mercury = @Job
AND YEAR(RETIREMENT) = 2154
AND USED.PositionID IS NULL
) E
WHERE [CFG_EmpNumber].Personnell_Number = @Employee

UPDATE PIN
SET Position_Assigned = 1
FROM Placement_Integrator PIN
INNER JOIN [dbo].[CFG_EmpNumber] EMP on EMP.Placement_ID = PIN.Placement_ID 
WHERE PositionID IS NOT NULL AND Position_Assigned = 0

SELECT TOP 1 PositionID, PT.*, PO.Compensation_Region FROM [CFG_EmpNumber] E
INNER JOIN [dbo].[Placement_Transaction] PT on PT.Placment_Id = E.Placement_ID AND Is_Latest = 1
LEFT JOIN [dbo].[CFG_Office_PINO] PO on PO.Office = PT.Office
WHERE [Personnell_Number] = @Employee

