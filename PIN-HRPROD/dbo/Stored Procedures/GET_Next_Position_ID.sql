
CREATE PROCEDURE [dbo].[GET_Next_Position_ID]
(@Vac_ID NVARCHAR(256) )
AS

DECLARE @ID Int

INSERT INTO CFG_Next_Position  
(Vacancy_Ref)
VALUES (@Vac_ID)
SET @ID = @@IDENTITY


UPDATE CFG_Next_Position
SET Position_ID = STUFF('P-800000',9-LEN(@ID),LEN(@ID),@ID)

WHERE Vacancy_Ref = @Vac_ID

SELECT STUFF('P-800000',9-LEN(@ID),LEN(@ID),@ID) AS PID
