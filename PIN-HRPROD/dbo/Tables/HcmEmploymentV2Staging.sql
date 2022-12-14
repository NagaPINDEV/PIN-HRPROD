CREATE TABLE [dbo].[HcmEmploymentV2Staging] (
    [DEFINITIONGROUP]           NVARCHAR (60)  COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [EXECUTIONID]               NVARCHAR (90)  COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [ISSELECTED]                INT            NOT NULL,
    [TRANSFERSTATUS]            INT            NOT NULL,
    [DIMENSIONDISPLAYVALUE]     NVARCHAR (500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [REGULATORYESTABLISHMENTID] NVARCHAR (30)  COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [WORKERTYPE]                INT            NOT NULL,
    [LEGALENTITYID]             NVARCHAR (4)   COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [EMPLOYMENTSTARTDATE]       DATETIME       NOT NULL,
    [EMPLOYMENTENDDATE]         DATETIME       NOT NULL,
    [PERSONNELNUMBER]           NVARCHAR (25)  COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [EMPLOYMENTID]              NVARCHAR (40)  COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [CALENDARID]                NVARCHAR (10)  COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [PARTITION]                 NVARCHAR (20)  NOT NULL,
    [SYNCSTARTDATETIME]         DATETIME       NOT NULL,
    [RECID]                     BIGINT         NOT NULL,
    CONSTRAINT [PK_HcmEmploymentV2Staging] UNIQUE NONCLUSTERED ([EXECUTIONID] ASC, [LEGALENTITYID] ASC, [PERSONNELNUMBER] ASC, [EMPLOYMENTID] ASC, [PARTITION] ASC)
);


GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_HcmEmploymentV2Staging]
    ON [dbo].[HcmEmploymentV2Staging];

