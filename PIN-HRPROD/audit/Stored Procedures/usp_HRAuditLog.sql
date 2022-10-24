CREATE Procedure [audit].[usp_HRAuditLog]
@Pipelinename nvarchar(max),
@source nvarchar(max),
@target nvarchar(max),
@executionDate Date,
@StartDateTime DateTime,
@EndDateTime Datetime,
@Rowread int,
@Rowcopied int,
@Errors nvarchar(max)
as
begin
INSERT INTO [audit].[HRAuditLog]
           ([Pipelinename]
           ,[source]
           ,[target]
           ,[executionDate]
		   ,[StartDateTime]
		   ,[EndDateTime]
           ,[Rowread]
           ,[Rowcopied]
           ,[Errors])
VALUES (@Pipelinename,@source,@target,@executionDate,@StartDateTime,@EndDateTime,@Rowread,@Rowcopied,@Errors)
end