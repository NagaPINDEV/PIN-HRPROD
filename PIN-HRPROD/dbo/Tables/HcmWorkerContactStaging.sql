CREATE TABLE [dbo].[HcmWorkerContactStaging] (
    [PURPOSE]           NVARCHAR (1000) NOT NULL,
    [DEFINITIONGROUP]   NVARCHAR (60)   NOT NULL,
    [EXECUTIONID]       NVARCHAR (90)   NOT NULL,
    [ISSELECTED]        INT             NOT NULL,
    [TRANSFERSTATUS]    INT             NOT NULL,
    [PERSONNELNUMBER]   NVARCHAR (25)   NOT NULL,
    [TYPE]              INT             NOT NULL,
    [LOCATOR]           NVARCHAR (255)  NOT NULL,
    [DESCRIPTION]       NVARCHAR (60)   NOT NULL,
    [LOCATOREXTENSION]  NVARCHAR (10)   NOT NULL,
    [COUNTRYREGIONCODE] NVARCHAR (5)    NOT NULL,
    [ISPRIMARY]         INT             NOT NULL,
    [ISMOBILEPHONE]     INT             NOT NULL,
    [ISPRIVATE]         INT             NOT NULL,
    [LOCATIONID]        NVARCHAR (40)   NOT NULL,
    [PARTITION]         NVARCHAR (20)   NOT NULL,
    [SYNCSTARTDATETIME] DATETIME        NOT NULL,
    [RECID]             BIGINT          NOT NULL
);

