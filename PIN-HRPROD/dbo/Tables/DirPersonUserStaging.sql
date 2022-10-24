﻿CREATE TABLE [dbo].[DirPersonUserStaging] (
    [DEFINITIONGROUP]    NVARCHAR (60)  NOT NULL,
    [EXECUTIONID]        NVARCHAR (90)  NOT NULL,
    [ISSELECTED]         INT            NOT NULL,
    [TRANSFERSTATUS]     INT            NOT NULL,
    [USERID]             NVARCHAR (20)  NOT NULL,
    [PERSONNELNUMBER]    NVARCHAR (40)  NOT NULL,
    [PERSONNAME]         NVARCHAR (100) NOT NULL,
    [PERSONNAMEALIAS]    NVARCHAR (20)  NOT NULL,
    [USEREMAIL]          NVARCHAR (255) NOT NULL,
    [PERSONPRIMARYEMAIL] NVARCHAR (255) NOT NULL,
    [VALIDFROM]          DATETIME       NOT NULL,
    [VALIDTO]            DATETIME       NOT NULL,
    [PARTITION]          NVARCHAR (20)  NOT NULL,
    [SYNCSTARTDATETIME]  DATETIME       NOT NULL,
    [RECID]              BIGINT         NOT NULL
);

