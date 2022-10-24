CREATE TABLE [hr].[mshr_dirpersonuserentity] (
    [mshr_userid]                NVARCHAR (MAX)   NULL,
    [mshr_partynumber]           NVARCHAR (MAX)   NULL,
    [mshr_personname]            NVARCHAR (MAX)   NULL,
    [mshr_personnamealias]       NVARCHAR (MAX)   NULL,
    [mshr_useremail]             NVARCHAR (MAX)   NULL,
    [mshr_personprimaryemail]    NVARCHAR (MAX)   NULL,
    [mshr_validfrom]             DATETIME2 (7)    NULL,
    [mshr_validto]               DATETIME2 (7)    NULL,
    [mshr_primaryfield]          NVARCHAR (MAX)   NULL,
    [mshr_dirpersonuserentityid] UNIQUEIDENTIFIER NULL
);

