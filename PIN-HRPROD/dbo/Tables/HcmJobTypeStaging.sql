﻿CREATE TABLE [dbo].[HcmJobTypeStaging] (
    [DEFINITIONGROUP]   NVARCHAR (60) NOT NULL,
    [EXECUTIONID]       NVARCHAR (90) NOT NULL,
    [ISSELECTED]        INT           NOT NULL,
    [TRANSFERSTATUS]    INT           NOT NULL,
    [DESCRIPTION]       NVARCHAR (60) NOT NULL,
    [EXEMPTSTATUS]      INT           NOT NULL,
    [JOBTYPEID]         NVARCHAR (15) NOT NULL,
    [PAIDHOURLY]        INT           NOT NULL,
    [PARTITION]         NVARCHAR (20) NOT NULL,
    [SYNCSTARTDATETIME] DATETIME      NOT NULL,
    [RECID]             BIGINT        NOT NULL
);

