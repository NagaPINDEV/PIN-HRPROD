﻿CREATE PROCEDURE [dbo].[usp_hcmtruncate]
AS 
BEGIN
TRUNCATE TABLE [dbo].[HcmCertificateTypeStaging]
TRUNCATE TABLE [dbo].[HcmCompensationRegionStaging]
TRUNCATE TABLE [dbo].[HcmCompFixedEmplStaging]
TRUNCATE TABLE [dbo].[HcmEmployeeStaging]
TRUNCATE TABLE [dbo].[HcmEmploymentDetailStaging]
TRUNCATE TABLE [dbo].[HcmEmploymentStaging]
TRUNCATE TABLE [dbo].[HcmEthnicOriginStaging]
TRUNCATE TABLE [dbo].[HcmIdentificationTypeStaging]
TRUNCATE TABLE [dbo].[HcmIssuingAgencyStaging]
TRUNCATE TABLE [dbo].[HcmJobStaging]
TRUNCATE TABLE [dbo].[HcmJobTypeStaging]
TRUNCATE TABLE [dbo].[HcmLanguageCodeStaging]
TRUNCATE TABLE [dbo].[HcmPersonalContactPersonStaging]
TRUNCATE TABLE [dbo].[HcmPersonCertificateStaging]
TRUNCATE TABLE [dbo].[HcmPersonIdentificationNumberStaging]
TRUNCATE TABLE [dbo].[HcmPositionHierarchyStaging]
TRUNCATE TABLE [dbo].[HcmPositionV2Staging]
TRUNCATE TABLE [dbo].[HcmPositionWorkerAssignmentV2Staging]
TRUNCATE TABLE [dbo].[HcmWorkerContactStaging]
TRUNCATE TABLE [dbo].[HcmWorkerStaging]
END