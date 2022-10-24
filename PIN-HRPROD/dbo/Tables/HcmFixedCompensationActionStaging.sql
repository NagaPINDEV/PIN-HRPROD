CREATE TABLE [dbo].[HcmFixedCompensationActionStaging] (
    [DEFINITIONGROUP]   NVARCHAR (60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [EXECUTIONID]       NVARCHAR (90) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [ISSELECTED]        INT           NOT NULL,
    [TRANSFERSTATUS]    INT           NOT NULL,
    [ACTION]            NVARCHAR (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [ACTIVE]            INT           NOT NULL,
    [DESCRIPTION]       NVARCHAR (60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [TYPE]              INT           NOT NULL,
    [PARTITION]         NVARCHAR (20) NOT NULL,
    [DATAAREAID]        NVARCHAR (4)  NOT NULL,
    [SYNCSTARTDATETIME] DATETIME      NOT NULL,
    CONSTRAINT [PK_HcmFixedCompensationActionStaging] UNIQUE NONCLUSTERED ([EXECUTIONID] ASC, [ACTION] ASC, [DATAAREAID] ASC, [PARTITION] ASC)
);


GO
CREATE NONCLUSTERED INDEX [I_DATAAREAID]
    ON [dbo].[HcmFixedCompensationActionStaging]([PARTITION] ASC, [DATAAREAID] ASC);


GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_HcmFixedCompensationActionStaging]
    ON [dbo].[HcmFixedCompensationActionStaging];

