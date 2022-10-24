create view New_Starter
As
  select StartDate,FirstName, LastName,Office,Brand,Team from [dbo].[Placement_Integrator] i
  Inner join [dbo].[Placement_Transaction] t on i.Placement_ID=t.Placment_Id and Is_Latest=1
  where Email_Sent=0