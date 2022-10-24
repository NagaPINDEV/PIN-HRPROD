CREATE TABLE [dbo].[CFG_Integration_Log] (
    [regardingid] VARCHAR (124) NULL,
    [regarding]   VARCHAR (20)  NULL,
    [action]      VARCHAR (20)  NULL,
    [message]     VARCHAR (255) NULL,
    [ts]          DATETIME      DEFAULT (getdate()) NULL
);

