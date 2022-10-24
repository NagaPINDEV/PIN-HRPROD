CREATE TABLE [audit].[HRAuditLog] (
    [ID]                  INT            IDENTITY (1, 1) NOT NULL,
    [Pipelinename]        NVARCHAR (MAX) NULL,
    [source]              NVARCHAR (MAX) NULL,
    [target]              NVARCHAR (MAX) NULL,
    [executionDate]       DATE           NULL,
    [StartDateTime]       DATETIME       NULL,
    [EndDateTime]         DATETIME       NULL,
    [Rowread]             INT            NULL,
    [Rowcopied]           INT            NULL,
    [Errors]              NVARCHAR (MAX) NULL,
    [TotalTimeTakenInSec] AS             (datediff(second,[StartDateTime],[EndDateTime]))
);

