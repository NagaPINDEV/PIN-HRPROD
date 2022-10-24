CREATE TABLE [dbo].[Leavers_Processed] (
    [HRISID]       NVARCHAR (10) NULL,
    [DateInserted] DATETIME      DEFAULT (getdate()) NOT NULL
);

