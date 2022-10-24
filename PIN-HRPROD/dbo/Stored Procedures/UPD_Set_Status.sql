CREATE PROCEDURE [dbo].[UPD_Set_Status]
(@Placment_Id varchar(256), @StatusType INT, @Status INT)
AS

IF @StatusType = 1
BEGIN -- WORKER
UPDATE PIN
SET Worker_Created = @Status
FROM Placement_Integrator PIN
WHERE Placement_ID = @Placment_Id
END


IF @StatusType = 2
BEGIN -- Employee
UPDATE PIN
SET Employment_Created = @Status
FROM Placement_Integrator PIN
WHERE Placement_ID = @Placment_Id
END



IF @StatusType = 4
BEGIN -- Employee
UPDATE PIN
SET Email_Sent = @Status
FROM Placement_Integrator PIN
WHERE Placement_ID = @Placment_Id
END
