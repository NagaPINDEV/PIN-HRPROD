CREATE TABLE [dbo].[HcmPositionHierarchyTypeStaging] (
    [DEFINITIONGROUP]   NVARCHAR (60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [EXECUTIONID]       NVARCHAR (90) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [ISSELECTED]        INT           NOT NULL,
    [TRANSFERSTATUS]    INT           NOT NULL,
    [NAME]              NVARCHAR (60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [PARTITION]         NVARCHAR (20) NOT NULL,
    [SYNCSTARTDATETIME] DATETIME      NOT NULL,
    [RECID]             BIGINT        NOT NULL,
    CONSTRAINT [PK_HcmPositionHierarchyTypeStaging] UNIQUE NONCLUSTERED ([EXECUTIONID] ASC, [NAME] ASC, [PARTITION] ASC)
);


GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_HcmPositionHierarchyTypeStaging]
    ON [dbo].[HcmPositionHierarchyTypeStaging];

