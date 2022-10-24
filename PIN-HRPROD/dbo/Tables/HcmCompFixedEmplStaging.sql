﻿CREATE TABLE [dbo].[HcmCompFixedEmplStaging] (
    [DIMENSIONDISPLAYVALUE] NVARCHAR (500)   NOT NULL,
    [DEFINITIONGROUP]       NVARCHAR (60)    NOT NULL,
    [EXECUTIONID]           NVARCHAR (90)    NOT NULL,
    [ISSELECTED]            INT              NOT NULL,
    [TRANSFERSTATUS]        INT              NOT NULL,
    [ACTION]                NVARCHAR (10)    NOT NULL,
    [LINENUMBER]            NUMERIC (32, 16) NOT NULL,
    [PAYFREQUENCY]          NVARCHAR (10)    NOT NULL,
    [PAYRATE]               NUMERIC (32, 16) NOT NULL,
    [PLAN_]                 NVARCHAR (10)    NOT NULL,
    [PROCESSTYPE]           INT              NOT NULL,
    [STEP]                  NVARCHAR (10)    NOT NULL,
    [TYPE]                  INT              NOT NULL,
    [EFFECTIVEDATE]         DATETIME         NOT NULL,
    [EXPIRATIONDATE]        DATETIME         NOT NULL,
    [POSITIONID]            NVARCHAR (25)    NOT NULL,
    [PERSONNELNUMBER]       NVARCHAR (25)    NOT NULL,
    [COMPENSATIONLEVELID]   NVARCHAR (15)    NOT NULL,
    [PARTITION]             NVARCHAR (20)    NOT NULL,
    [DATAAREAID]            NVARCHAR (4)     NOT NULL,
    [SYNCSTARTDATETIME]     DATETIME         NOT NULL,
    [RECID]                 BIGINT           NOT NULL
);

