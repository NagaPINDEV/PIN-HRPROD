CREATE TABLE [dbo].[LeavePlanV2Staging] (
    [DEFINITIONGROUP]               NVARCHAR (60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [EXECUTIONID]                   NVARCHAR (90) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [ISSELECTED]                    INT           NOT NULL,
    [TRANSFERSTATUS]                INT           NOT NULL,
    [NAME]                          NVARCHAR (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [DESCRIPTION]                   NVARCHAR (60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [STARTDATE]                     DATETIME      NOT NULL,
    [ACCRUALFREQUENCY]              INT           NOT NULL,
    [ACCRUALPERIODBASIS]            INT           NOT NULL,
    [EMPLOYEESPECIFICDATEFIELDNAME] NVARCHAR (81) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [EMPLOYEESPECIFICDATETABLENAME] NVARCHAR (81) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [ACCRUALTYPE]                   INT           NOT NULL,
    [HOURSWORKEDTYPE]               INT           NOT NULL,
    [ENROLLMENTACCRUALPOLICY]       INT           NOT NULL,
    [UNENROLLMENTACCRUALPOLICY]     INT           NOT NULL,
    [ACCRUALAWARDDATEBASIS]         INT           NOT NULL,
    [PARTITION]                     NVARCHAR (20) NOT NULL,
    [DATAAREAID]                    NVARCHAR (4)  NOT NULL,
    [SYNCSTARTDATETIME]             DATETIME      NOT NULL,
    [RECID]                         BIGINT        NOT NULL,
    CONSTRAINT [PK_LeavePlanV2Staging] UNIQUE NONCLUSTERED ([EXECUTIONID] ASC, [NAME] ASC, [DATAAREAID] ASC, [PARTITION] ASC)
);


GO
CREATE NONCLUSTERED INDEX [I_DATAAREAID]
    ON [dbo].[LeavePlanV2Staging]([PARTITION] ASC, [DATAAREAID] ASC);


GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_LeavePlanV2Staging]
    ON [dbo].[LeavePlanV2Staging];

