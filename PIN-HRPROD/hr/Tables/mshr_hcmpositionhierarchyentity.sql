CREATE TABLE [hr].[mshr_hcmpositionhierarchyentity] (
    [mshr_validfrom]                    DATETIME2 (7)    NULL,
    [mshr_validto]                      DATETIME2 (7)    NULL,
    [mshr_positionid]                   NVARCHAR (MAX)   NULL,
    [mshr_parentpositionid]             NVARCHAR (MAX)   NULL,
    [mshr_hierarchytypename]            NVARCHAR (MAX)   NULL,
    [mshr_primaryfield]                 NVARCHAR (MAX)   NULL,
    [mshr_hcmpositionhierarchyentityid] UNIQUEIDENTIFIER NULL
);

