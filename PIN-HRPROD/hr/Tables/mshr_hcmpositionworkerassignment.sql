CREATE TABLE [hr].[mshr_hcmpositionworkerassignment] (
    [mshr_positionid]                            NVARCHAR (MAX)   NULL,
    [mshr_personnelnumber]                       NVARCHAR (MAX)   NULL,
    [mshr_reasoncodeid]                          NVARCHAR (MAX)   NULL,
    [mshr_isprimaryposition]                     INT              NULL,
    [mshr_validfrom]                             DATETIME2 (7)    NULL,
    [mshr_validto]                               DATETIME2 (7)    NULL,
    [mshr_careertrack_custom]                    NVARCHAR (MAX)   NULL,
    [mshr_primaryfield]                          NVARCHAR (MAX)   NULL,
    [mshr_hcmpositionworkerassignmentv2entityid] UNIQUEIDENTIFIER NULL
);

