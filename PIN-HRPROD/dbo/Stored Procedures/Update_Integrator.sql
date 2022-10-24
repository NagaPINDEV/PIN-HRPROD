 
CREATE PROCEDURE [dbo].[Update_Integrator] (
@Title varchar(256),
@Vacancy_ID varchar(256),
@Placement_ID varchar(256),
@Consultant_ID varchar(256),
@Candidate_ID varchar(256),
@Manager_Contact_ID varchar(256),
@Candidate_Name varchar(256),
@HRIS_Personnel_Number varchar(256),
@Worker_Created INT,
@Employment_Created INT,
@Position_Assigned INT,
@Exists INT,
@Successfull INT
)
AS


SET @Exists = (SELECT COUNT(*) FROM Placement_Integrator WHERE Placement_ID = @Placement_ID )

IF @Exists = 1
BEGIN
UPDATE  P
SET
Title 					   = @Title ,
 Vacancy_ID 			   = @Vacancy_ID ,
 Placement_ID 			   = @Placement_ID ,
 Consultant_ID 			   = @Consultant_ID ,
 Candidate_ID 			   = @Candidate_ID ,
 Manager_Contact_ID 	   = @Manager_Contact_ID ,
 Candidate_Name 		   = @Candidate_Name ,
 HRIS_Personnel_Number	   = @HRIS_Personnel_Number,
 Worker_Created 		   = @Worker_Created ,
 Employment_Created 	   = @Employment_Created ,
 Position_Assigned 		   = @Position_Assigned ,
 SuccesfullStart			= @Successfull
 FROM Placement_Integrator P  WHERE Placement_ID = @Placement_ID 
END



IF @Exists = 0
BEGIN
INSERT INTO dbo.Placement_Integrator
(Title ,
 Vacancy_ID ,
 Placement_ID ,
 Consultant_ID ,
 Candidate_ID ,
 Manager_Contact_ID ,
 Candidate_Name ,
 HRIS_Personnel_Number,
 Worker_Created ,
 Employment_Created ,
 Position_Assigned ,
 SuccesfullStart
 )
 
 VALUES (
 @Title, 
 @Vacancy_ID,
 @Placement_Id,
 @Consultant_ID,
 @Candidate_ID,
 @Manager_Contact_ID ,
 @Candidate_Name ,
 @HRIS_Personnel_Number,
 @Worker_Created ,
 @Employment_Created ,
 @Position_Assigned ,
 @Successfull

 )
 END