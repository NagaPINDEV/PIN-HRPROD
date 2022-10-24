﻿CREATE TABLE [dbo].[LeaveEnrollmentV2Staging] (
    [DEFINITIONGROUP]    NVARCHAR (60) NOT NULL,
    [EXECUTIONID]        NVARCHAR (90) NOT NULL,
    [ISSELECTED]         INT           NOT NULL,
    [TRANSFERSTATUS]     INT           NOT NULL,
    [ISACCRUALSUSPENDED] INT           NOT NULL,
    [TIERBASIS]          INT           NOT NULL,
    [CUSTOMDATE]         DATETIME      NOT NULL,
    [STARTDATE]          DATETIME      NOT NULL,
    [ENDDATE]            DATETIME      NOT NULL,
    [ACCRUALSTARTDATE]   DATETIME      NOT NULL,
    [ACCRUALDATEBASIS]   DATETIME      NOT NULL,
    [PERSONNELNUMBER]    NVARCHAR (25) NOT NULL,
    [LEAVEPLANID]        NVARCHAR (30) NOT NULL,
    [PARTITION]          NVARCHAR (20) NOT NULL,
    [DATAAREAID]         NVARCHAR (4)  NOT NULL,
    [SYNCSTARTDATETIME]  DATETIME      NOT NULL,
    [RECID]              BIGINT        NOT NULL,
    CONSTRAINT [PK_LeaveEnrollmentV2Staging] PRIMARY KEY CLUSTERED ([EXECUTIONID] ASC, [STARTDATE] ASC, [PERSONNELNUMBER] ASC, [LEAVEPLANID] ASC, [DATAAREAID] ASC, [PARTITION] ASC)
);

