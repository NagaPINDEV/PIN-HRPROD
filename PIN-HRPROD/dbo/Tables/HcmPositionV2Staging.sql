﻿CREATE TABLE [dbo].[HcmPositionV2Staging] (
    [DEFINITIONGROUP]              NVARCHAR (60)   NOT NULL,
    [EXECUTIONID]                  NVARCHAR (90)   NOT NULL,
    [ISSELECTED]                   INT             NOT NULL,
    [TRANSFERSTATUS]               INT             NOT NULL,
    [POSITIONID]                   NVARCHAR (25)   NOT NULL,
    [AVAILABLEFORASSIGNMENT]       DATETIME        NOT NULL,
    [DESCRIPTION]                  NVARCHAR (60)   NOT NULL,
    [FULLTIMEEQUIVALENT]           NUMERIC (32, 6) NOT NULL,
    [DETAILEFFECTIVE]              DATETIME        NOT NULL,
    [DETAILEXPIRATION]             DATETIME        NOT NULL,
    [DEPARTMENTNUMBER]             NVARCHAR (30)   NOT NULL,
    [COMPENSATIONREGIONID]         NVARCHAR (10)   NOT NULL,
    [JOBID]                        NVARCHAR (100)  NOT NULL,
    [POSITIONTYPEID]               NVARCHAR (20)   NOT NULL,
    [TITLEID]                      NVARCHAR (65)   NOT NULL,
    [ACTIVATION]                   DATETIME        NOT NULL,
    [RETIREMENT]                   DATETIME        NOT NULL,
    [WORKERASSIGNMENTSTART]        DATETIME        NOT NULL,
    [WORKERASSIGNMENTEND]          DATETIME        NOT NULL,
    [WORKERPERSONNELNUMBER]        NVARCHAR (25)   NOT NULL,
    [WORKERASSIGNMENTREASONCODEID] NVARCHAR (15)   NOT NULL,
    [WORKERNAME]                   NVARCHAR (100)  NOT NULL,
    [PAIDBYLEGALENTITY]            NVARCHAR (4)    NOT NULL,
    [PAYCYCLEID]                   NVARCHAR (15)   NOT NULL,
    [ANNUALREGULARHOURS]           NUMERIC (32, 6) NOT NULL,
    [PAYROLLDETAILEFFECTIVE]       DATETIME        NOT NULL,
    [PAYROLLDETAILEXPIRATION]      DATETIME        NOT NULL,
    [PARTITION]                    NVARCHAR (20)   NOT NULL,
    [OFFICE_CUSTOM]                NVARCHAR (75)   NOT NULL,
    [TEAM_CUSTOM]                  NVARCHAR (75)   NOT NULL,
    [EEOJOBCLASSIFICATION_CUSTOM]  NVARCHAR (75)   NOT NULL,
    [TEAMV2_CUSTOM]                NVARCHAR (50)   NOT NULL,
    [SYNCSTARTDATETIME]            DATETIME        DEFAULT ('1900-01-01 00:00:00.000') NOT NULL,
    [SYNCENDDATETIME]              DATETIME        NULL,
    [RECID]                        BIGINT          NOT NULL,
    CONSTRAINT [PK_HcmPositionV2Staging] PRIMARY KEY CLUSTERED ([EXECUTIONID] ASC, [POSITIONID] ASC, [PARTITION] ASC)
);

