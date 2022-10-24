CREATE PROCEDURE Get_InProgress_Records
AS
SELECT * FROM
Placement_Integrator
WHERE IR_Complete = 0