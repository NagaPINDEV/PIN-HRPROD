CREATE PROCEDURE UPD_Error
(@Placement_ID NVARCHAR(256), @Error NVARCHAR(512))
AS
UPDATE Placement_Integrator
SET Error_Occured = 1
,Error_Msg = @Error


