CREATE TABLE [dbo].[HcmPersonIdentificationNumberStaging] (
    [DEFINITIONGROUP]      NVARCHAR (60) NOT NULL,
    [EXECUTIONID]          NVARCHAR (90) NOT NULL,
    [ISSELECTED]           INT           NOT NULL,
    [TRANSFERSTATUS]       INT           NOT NULL,
    [ENTRYTYPE]            NVARCHAR (35) NOT NULL,
    [DESCRIPTION]          NVARCHAR (60) NOT NULL,
    [EXPIRATIONDATE]       DATETIME      NOT NULL,
    [ISPRIMARY]            INT           NOT NULL,
    [ISSUEDDATE]           DATETIME      NOT NULL,
    [IDENTIFICATIONNUMBER] NVARCHAR (35) NOT NULL,
    [PARTYNUMBER]          NVARCHAR (40) NOT NULL,
    [IDENTIFICATIONTYPEID] NVARCHAR (15) NOT NULL,
    [ISSUINGAGENCYID]      NVARCHAR (15) NOT NULL,
    [PARTITION]            NVARCHAR (20) NOT NULL,
    [SYNCSTARTDATETIME]    DATETIME      NOT NULL,
    [RECID]                BIGINT        NOT NULL
);

