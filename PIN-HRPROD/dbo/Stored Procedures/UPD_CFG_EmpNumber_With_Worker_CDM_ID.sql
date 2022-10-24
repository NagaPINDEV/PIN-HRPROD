CREATE PROCEDURE UPD_CFG_EmpNumber_With_Worker_CDM_ID
(@Placement_Id nvarchar(256), @WorkerId nvarchar(256))
AS
UPDATE CFG_EmpNumber
SET Worker_CDM = @WorkerId
WHERE Placement_ID = @Placement_Id