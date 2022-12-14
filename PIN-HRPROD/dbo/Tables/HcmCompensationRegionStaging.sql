CREATE TABLE [dbo].[HcmCompensationRegionStaging] (
    [DEFINITIONGROUP]   NVARCHAR (60) NOT NULL,
    [EXECUTIONID]       NVARCHAR (90) NOT NULL,
    [ISSELECTED]        INT           NOT NULL,
    [TRANSFERSTATUS]    INT           NOT NULL,
    [LOCATION]          NVARCHAR (10) NOT NULL,
    [DESCRIPTION]       NVARCHAR (60) NOT NULL,
    [PARTITION]         NVARCHAR (20) NOT NULL,
    [SYNCSTARTDATETIME] DATETIME      NOT NULL,
    [RECID]             BIGINT        NOT NULL
);

