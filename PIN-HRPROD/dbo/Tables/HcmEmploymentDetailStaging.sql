﻿CREATE TABLE [dbo].[HcmEmploymentDetailStaging] (
    [DEFINITIONGROUP]         NVARCHAR (60) NOT NULL,
    [EXECUTIONID]             NVARCHAR (90) NOT NULL,
    [ISSELECTED]              INT           NOT NULL,
    [TRANSFERSTATUS]          INT           NOT NULL,
    [ADJUSTEDWORKERSTARTDATE] DATETIME      NOT NULL,
    [EMPLOYERNOTICEAMOUNT]    INT           NOT NULL,
    [EMPLOYERUNITOFNOTICE]    INT           NOT NULL,
    [LASTDATEWORKED]          DATETIME      NOT NULL,
    [TRANSITIONDATE]          DATETIME      NOT NULL,
    [VALIDFROM]               DATETIME      NOT NULL,
    [VALIDTO]                 DATETIME      NOT NULL,
    [WORKERNOTICEAMOUNT]      INT           NOT NULL,
    [WORKERSTARTDATE]         DATETIME      NOT NULL,
    [WORKERUNITOFNOTICE]      INT           NOT NULL,
    [EMPLOYMENTSTARTDATE]     DATETIME      NOT NULL,
    [EMPLOYMENTENDDATE]       DATETIME      NOT NULL,
    [LEGALENTITYID]           NVARCHAR (4)  NOT NULL,
    [PERSONNELNUMBER]         NVARCHAR (25) NOT NULL,
    [REASONCODEID]            NVARCHAR (15) NOT NULL,
    [EMPLOYMENTTYPE]          INT           NOT NULL,
    [PARTITION]               NVARCHAR (20) NOT NULL,
    [EMPLOYMENTTYPEID]        NVARCHAR (20) NOT NULL,
    [EMPLOYMENTCATEGORYID]    NVARCHAR (25) NOT NULL,
    [BENEFITEMPLOYMENTSTATUS] INT           NOT NULL,
    [PAYFREQUENCYID]          NVARCHAR (20) NOT NULL,
    [SYNCSTARTDATETIME]       DATETIME      NOT NULL,
    [RECID]                   BIGINT        NOT NULL
);

