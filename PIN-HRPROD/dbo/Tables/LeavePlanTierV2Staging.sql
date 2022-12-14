CREATE TABLE [dbo].[LeavePlanTierV2Staging] (
    [DEFINITIONGROUP]        NVARCHAR (60)    NOT NULL,
    [EXECUTIONID]            NVARCHAR (90)    NOT NULL,
    [ISSELECTED]             INT              NOT NULL,
    [TRANSFERSTATUS]         INT              NOT NULL,
    [ACCRUALAMOUNT]          NUMERIC (32, 6)  NOT NULL,
    [GRANT_]                 NUMERIC (32, 6)  NOT NULL,
    [TIERNUMBER]             NUMERIC (32, 16) NOT NULL,
    [MAXIMUMBALANCE]         NUMERIC (32, 6)  NOT NULL,
    [MAXIMUMCARRYOVER]       NUMERIC (32, 6)  NOT NULL,
    [MINIMUMBALANCE]         NUMERIC (32, 6)  NOT NULL,
    [MONTHSOFSERVICE]        NUMERIC (32, 6)  NOT NULL,
    [QUALIFYINGAMOUNT]       NUMERIC (32, 6)  NOT NULL,
    [LEAVEPLANID]            NVARCHAR (30)    NOT NULL,
    [USEFULLTIMEEQUIVALENCY] INT              NOT NULL,
    [LEAVETYPEID]            NVARCHAR (30)    NOT NULL,
    [PARTITION]              NVARCHAR (20)    NOT NULL,
    [DATAAREAID]             NVARCHAR (4)     NOT NULL,
    [SYNCSTARTDATETIME]      DATETIME         NOT NULL,
    [RECID]                  BIGINT           NOT NULL,
    CONSTRAINT [PK_LeavePlanTierV2Staging] PRIMARY KEY CLUSTERED ([EXECUTIONID] ASC, [TIERNUMBER] ASC, [LEAVEPLANID] ASC, [LEAVETYPEID] ASC, [DATAAREAID] ASC, [PARTITION] ASC)
);

