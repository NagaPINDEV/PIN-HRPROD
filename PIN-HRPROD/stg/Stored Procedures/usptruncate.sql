CREATE procedure [stg].[usptruncate]
AS 
begin
	DROP TABLE IF EXISTS [hr].[mshr_hcmpositionworkerassignment]--
	DROP TABLE IF EXISTS [hr].[mshr_hcmpositionhierarchyentity]--
	DROP TABLE IF EXISTS [hr].[mshr_hcmpositiondetailentity]--
	DROP TABLE IF EXISTS [hr].[mshr_dirpersonentity]--
	DROP TABLE IF EXISTS [hr].[mshr_hrvirtualentitycatalog]--
	DROP TABLE IF EXISTS [hr].[mshr_hcmpersonalcontactpersonentity]--
	DROP TABLE IF EXISTS [hr].[mshr_hcmpersonalcontactpersonentity]--
	DROP TABLE IF EXISTS [hr].[mshr_jobcompensationentity]--
	DROP TABLE IF EXISTS [hr].[mshr_hcmworkercontactv2entity]--
	DROP TABLE IF EXISTS [hr].[mshr_hcmemploymentdetailentity]--
	DROP TABLE IF EXISTS [hr].[mshr_hcmworker]
end 
