CREATE TABLE [dbo].[HRIS_TA_ChangeLog] (
    [PersonnelNumber] VARCHAR (10) NOT NULL,
    [changed]         BIT          NULL,
    PRIMARY KEY CLUSTERED ([PersonnelNumber] ASC)
);

