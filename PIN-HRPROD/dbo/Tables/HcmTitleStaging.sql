﻿CREATE TABLE [dbo].[HcmTitleStaging] (
    [DEFINITIONGROUP]   NVARCHAR (60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [EXECUTIONID]       NVARCHAR (90) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [ISSELECTED]        INT           NOT NULL,
    [TRANSFERSTATUS]    INT           NOT NULL,
    [TITLEID]           NVARCHAR (65) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [PARTITION]         NVARCHAR (20) NOT NULL,
    [SYNCSTARTDATETIME] DATETIME      NOT NULL,
    [RECID]             BIGINT        NOT NULL,
    CONSTRAINT [PK_HcmTitleStaging] UNIQUE NONCLUSTERED ([EXECUTIONID] ASC, [TITLEID] ASC, [PARTITION] ASC)
);


GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_HcmTitleStaging]
    ON [dbo].[HcmTitleStaging];
