﻿CREATE TABLE [dbo].[HcmEmploymentStaging] (
    [DEFINITIONGROUP]             NVARCHAR (60)  NOT NULL,
    [EXECUTIONID]                 NVARCHAR (90)  NOT NULL,
    [ISSELECTED]                  INT            NOT NULL,
    [TRANSFERSTATUS]              INT            NOT NULL,
    [DIMENSIONDISPLAYVALUE]       NVARCHAR (500) NOT NULL,
    [REGULATORYESTABLISHMENTID]   NVARCHAR (30)  NOT NULL,
    [WORKERTYPE]                  INT            NOT NULL,
    [LEGALENTITYID]               NVARCHAR (4)   NOT NULL,
    [EMPLOYMENTSTARTDATE]         DATETIME       NOT NULL,
    [EMPLOYMENTENDDATE]           DATETIME       NOT NULL,
    [PERSONNELNUMBER]             NVARCHAR (25)  NOT NULL,
    [CALENDARID]                  NVARCHAR (10)  NOT NULL,
    [PARTITION]                   NVARCHAR (20)  NOT NULL,
    [EXITTYPE_CUSTOM]             NVARCHAR (75)  NOT NULL,
    [EXTENDEDPROBATIONEND_CUSTOM] DATETIME       NOT NULL,
    [LEAVINGREASON_CUSTOM]        NVARCHAR (75)  NOT NULL,
    [LEAVINGREASONOTHER_CUSTOM]   NVARCHAR (100) NOT NULL,
    [ORIGPROBATIONENDDATE_CUSTOM] DATETIME       NOT NULL,
    [PROBATIONCOMPLETE_CUSTOM]    INT            NOT NULL,
    [PROBATIONPASSEDDATE_CUSTOM]  DATETIME       NOT NULL,
    [REHIRE_CUSTOM]               INT            NOT NULL,
    [PAYROLLID_CUSTOM]            NVARCHAR (15)  NOT NULL,
    [SYNCSTARTDATETIME]           DATETIME       NOT NULL,
    [RECID]                       BIGINT         NOT NULL,
    CONSTRAINT [PK_HcmEmploymentStaging] PRIMARY KEY CLUSTERED ([EXECUTIONID] ASC, [LEGALENTITYID] ASC, [EMPLOYMENTSTARTDATE] ASC, [EMPLOYMENTENDDATE] ASC, [PERSONNELNUMBER] ASC, [PARTITION] ASC)
);
