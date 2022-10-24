﻿CREATE TABLE [dbo].[HcmPositionHierarchyStaging] (
    [DEFINITIONGROUP]   NVARCHAR (60) NOT NULL,
    [EXECUTIONID]       NVARCHAR (90) NOT NULL,
    [ISSELECTED]        INT           NOT NULL,
    [TRANSFERSTATUS]    INT           NOT NULL,
    [VALIDFROM]         DATETIME      NOT NULL,
    [VALIDTO]           DATETIME      NOT NULL,
    [POSITIONID]        NVARCHAR (25) NOT NULL,
    [PARENTPOSITIONID]  NVARCHAR (25) NOT NULL,
    [HIERARCHYTYPENAME] NVARCHAR (60) NOT NULL,
    [PARTITION]         NVARCHAR (20) NOT NULL,
    [SYNCSTARTDATETIME] DATETIME      NOT NULL,
    [RECID]             BIGINT        NOT NULL
);

