CREATE Procedure Leavers_Processed_Exists (@PERSONNELNUMBER nvarchar(20))
As 
Declare @exists nvarchar(20)
SET @exists=(SELECT top 1 HRISID FROM Leavers_Processed
                   WHERE HRISID = @PERSONNELNUMBER)

				print @exists
				print len(@exists)
if @exists IS NULL
BEGIN
INSERT INTO Leavers_Processed
       VALUES (@PERSONNELNUMBER, getdate())
END