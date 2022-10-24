CREATE TABLE [dbo].[DirPartyContactStaging] (
    [PURPOSE]           NVARCHAR (1000) NOT NULL,
    [DEFINITIONGROUP]   NVARCHAR (60)   NOT NULL,
    [EXECUTIONID]       NVARCHAR (90)   NOT NULL,
    [ISSELECTED]        INT             NOT NULL,
    [TRANSFERSTATUS]    INT             NOT NULL,
    [PARTYNUMBER]       NVARCHAR (40)   NOT NULL,
    [LOCATIONID]        NVARCHAR (30)   NOT NULL,
    [DESCRIPTION]       NVARCHAR (60)   NOT NULL,
    [TYPE]              INT             NOT NULL,
    [COUNTRYREGIONCODE] NVARCHAR (5)    NOT NULL,
    [LOCATOR]           NVARCHAR (255)  NOT NULL,
    [LOCATOREXTENSION]  NVARCHAR (10)   NOT NULL,
    [ISMOBILEPHONE]     INT             NOT NULL,
    [ISINSTANTMESSAGE]  INT             NOT NULL,
    [ISPRIMARY]         INT             NOT NULL,
    [ISPRIVATE]         INT             NOT NULL,
    [PARTITION]         NVARCHAR (20)   NOT NULL,
    [SYNCSTARTDATETIME] DATETIME        NOT NULL,
    [RECID]             BIGINT          NOT NULL
);

