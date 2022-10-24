CREATE TABLE [audit].[HCMAuditLog] (
    [ID]                  INT            IDENTITY (1, 1) NOT NULL,
    [Table]               NVARCHAR (MAX) NULL,
    [executionDate]       DATE           NULL,
    [StartDateTime]       DATETIME       NULL,
    [EndDateTime]         DATETIME       NULL,
    [Rows]                INT            NULL,
    [Errors]              NVARCHAR (MAX) NULL,
    [TotalTimeTakenInSec] AS             (datediff(second,[StartDateTime],[EndDateTime]))
);

