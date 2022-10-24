CREATE TABLE [dbo].[HcmIdentificationTypeStaging] (
    [DEFINITIONGROUP]            NVARCHAR (60) NOT NULL,
    [EXECUTIONID]                NVARCHAR (90) NOT NULL,
    [ISSELECTED]                 INT           NOT NULL,
    [TRANSFERSTATUS]             INT           NOT NULL,
    [DESCRIPTION]                NVARCHAR (60) NOT NULL,
    [IDENTIFICATIONTYPEID]       NVARCHAR (15) NOT NULL,
    [CHECKDUPLICATES]            INT           NOT NULL,
    [ALLOWEDVALUES]              INT           NOT NULL,
    [IDENTIFICATIONNUMBERFORMAT] NVARCHAR (35) NOT NULL,
    [FIXEDLENGTH]                INT           NOT NULL,
    [PARTITION]                  NVARCHAR (20) NOT NULL,
    [SYNCSTARTDATETIME]          DATETIME      NOT NULL,
    [RECID]                      BIGINT        NOT NULL
);

