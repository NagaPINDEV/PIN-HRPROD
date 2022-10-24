CREATE PROCEDURE [audit].[usp_updHRAuditLog]
@source nvarchar(max),
@target nvarchar(max),
@StartDateTime DateTime,
@Rowread int,
@Rowcopied int,
@Errors nvarchar(max)
as 
BEGIN
	update [audit].[HRAuditLog]
	SET  [EndDateTime] = GETDATE()
	   , [Rowread] = @Rowread
	   , [Rowcopied] = @Rowcopied
	   , [Errors] = @Errors
	WHERE [source] = @source
		and [target] = @target
	--	and StartDateTime = @StartDateTime
END 