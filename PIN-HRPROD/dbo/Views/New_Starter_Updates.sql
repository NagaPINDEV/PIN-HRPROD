 CREATE view New_Starter_Updates
 As
select c.Personnell_Number, FirstName,LastName, StartDate,'Unknown' as Manager, coalesce(Legalentity,'PI04') as Legalentity, Office,Brand, Team,
'Unknown' as PositionId,'Unknown' as  Consultant,case when Min(DateRecord)=DateRecord then 'NewStarter' else 'Update' END as UpdateType
from  [dbo].[Placement_Transaction] t
 left join [dbo].[CFG_EmpNumber] c on c.Placement_ID=t.Placment_Id 
Group by  FirstName,LastName, StartDate,Brand, Office, Team, Legalentity, DateRecord, c.Personnell_Number,Office,Brand, Team