--DROP TABLE CFG_EmpNumber
--CREATE TABLE CFG_EmpNumber
--(Personnel_ID INT IDENTITY(1,1), Placement_ID varchar(124), Personnell_Number varchar(20))


--POSITION WILL ALREADY EXIST

CREATE PROCEDURE [dbo].[GET_Personnel_Number]
( @PlacementId varchar(124)
)
AS


DECLARE @Op int, @ID Int ,@Return varchar(100)  --@Op 1 = placement exists, 0 - Create new placment
 

--DECLARE @PlacementId varchar(124) = 'MATTBx'

SET @Op = (SELECT TOP 1 COUNT(*) FROM CFG_EmpNumber WHERE Placement_ID = @PlacementId)


IF @Op = 0
BEGIN
PRINT 'Enter Value'

INSERT INTO CFG_EmpNumber  
(Placement_ID)
VALUES (@PlacementId)
SET @ID = @@IDENTITY

UPDATE CFG_EmpNumber
SET Personnell_Number = STUFF('E-800000',9-LEN(@ID),LEN(@ID),@ID)
,Employee_Number = STUFF('800000000',9-LEN(@ID),LEN(@ID),@ID)
WHERE Placement_ID = @PlacementId

SET @Return = (SELECT Personnell_Number FROM CFG_EmpNumber WHERE Placement_ID = @PlacementId)
END

IF @Op = 1 
BEGIN
SET @Return = (SELECT Personnell_Number FROM CFG_EmpNumber WHERE Placement_ID = @PlacementId)
END

SELECT Personnell_Number FROM CFG_EmpNumber WHERE Placement_ID = @PlacementId

