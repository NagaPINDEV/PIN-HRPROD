CREATE PROCEDURE UPD_Integration_Log
(@id varchar(124), @regarding varchar(20), @action varchar(20), @message varchar(255))
AS

INSERT INTO CFG_Integration_Log
SELECT @id,@regarding,@action,@message,GETDATE()
