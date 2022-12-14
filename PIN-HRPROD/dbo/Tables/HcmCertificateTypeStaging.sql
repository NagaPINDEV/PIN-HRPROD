CREATE TABLE [dbo].[HcmCertificateTypeStaging] (
    [DEFINITIONGROUP]   NVARCHAR (60) NOT NULL,
    [EXECUTIONID]       NVARCHAR (90) NOT NULL,
    [ISSELECTED]        INT           NOT NULL,
    [TRANSFERSTATUS]    INT           NOT NULL,
    [CERTIFICATETYPE]   NVARCHAR (15) NOT NULL,
    [DESCRIPTION]       NVARCHAR (60) NOT NULL,
    [REQUIRERENEWAL]    INT           NOT NULL,
    [PARTITION]         NVARCHAR (20) NOT NULL,
    [SYNCSTARTDATETIME] DATETIME      NOT NULL,
    [RECID]             BIGINT        NOT NULL,
    CONSTRAINT [PK_HcmCertificateTypeStaging] PRIMARY KEY CLUSTERED ([EXECUTIONID] ASC, [CERTIFICATETYPE] ASC, [PARTITION] ASC)
);

