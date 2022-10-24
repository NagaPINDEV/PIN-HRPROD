CREATE TABLE [hr].[mshr_hcmpositiondetailentity] (
    [mshr_jobfamilyid]               NVARCHAR (MAX)   NULL,
    [mshr_compensationregionid]      NVARCHAR (MAX)   NULL,
    [mshr_departmentnumber]          NVARCHAR (MAX)   NULL,
    [mshr_description]               NVARCHAR (MAX)   NULL,
    [mshr_fulltimeequivalent]        DECIMAL (38, 18) NULL,
    [mshr_jobid]                     NVARCHAR (MAX)   NULL,
    [mshr_positionid]                NVARCHAR (MAX)   NULL,
    [mshr_positiontypeid]            NVARCHAR (MAX)   NULL,
    [mshr_titleid]                   NVARCHAR (MAX)   NULL,
    [mshr_validfrom]                 DATETIME2 (7)    NULL,
    [mshr_validto]                   DATETIME2 (7)    NULL,
    [mshr_office_custom]             NVARCHAR (MAX)   NULL,
    [mshr_team_custom]               NVARCHAR (MAX)   NULL,
    [mshr_subteam_custom]            NVARCHAR (MAX)   NULL,
    [mshr_hcmpositiondetailentityid] UNIQUEIDENTIFIER NULL,
    [mshr_availableforassignment]    DATETIME2 (7)    NULL
);

