create procedure Proc_Leavers_Processed_ITFlow( 
    @ModifiedDate date,
	@ModifiedBy nvarchar(50),
	@EmploymentID nvarchar(20) ,
	@Personnelnumber nvarchar(10) ,
	@WorkerName nvarchar(50) ,@EmploymentEndDate date,
	@LastDayWorked date,
	@ManagerName nvarchar(50) ,
	@ManagerEmail nvarchar(50),
	@Lastdatemodified date,
	@Is_Latest int )
	As
	begin
Insert into Leavers_Processed_ITFlow values (@ModifiedDate,@ModifiedBy,@EmploymentID,@Personnelnumber,@WorkerName,@EmploymentEndDate,@LastDayWorked,
												@ManagerName,@ManagerEmail,@Lastdatemodified,@Is_Latest)
      END