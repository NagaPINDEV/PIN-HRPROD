CREATE TABLE [dbo].[SystemSecurityUserRoleAssociationStaging] (
    [DEFINITIONGROUP]        NVARCHAR (60)  COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [EXECUTIONID]            NVARCHAR (90)  COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [ISSELECTED]             INT            NOT NULL,
    [TRANSFERSTATUS]         INT            NOT NULL,
    [ASSIGNMENTMODE]         INT            NOT NULL,
    [ASSIGNMENTSTATUS]       INT            NOT NULL,
    [USERID]                 NVARCHAR (20)  COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [SECURITYROLEIDENTIFIER] NVARCHAR (81)  COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [SECURITYROLENAME]       NVARCHAR (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [PARTITION]              NVARCHAR (20)  NOT NULL,
    [SYNCSTARTDATETIME]      DATETIME       NOT NULL,
    [RECID]                  BIGINT         NOT NULL,
    CONSTRAINT [PK_SystemSecurityUserRoleAssociationStaging] UNIQUE NONCLUSTERED ([EXECUTIONID] ASC, [USERID] ASC, [SECURITYROLEIDENTIFIER] ASC, [PARTITION] ASC)
);


GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_SystemSecurityUserRoleAssociationStaging]
    ON [dbo].[SystemSecurityUserRoleAssociationStaging];

