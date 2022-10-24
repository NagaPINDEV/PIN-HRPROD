CREATE TABLE [hr].[mshr_hcmemploymentdetailentity] (
    [mshr_employernoticeamount]        INT              NULL,
    [mshr_employerunitofnotice]        INT              NULL,
    [mshr_transitiondate]              DATETIME2 (7)    NULL,
    [mshr_validfrom]                   DATETIME2 (7)    NULL,
    [mshr_validto]                     DATETIME2 (7)    NULL,
    [mshr_workernoticeamount]          INT              NULL,
    [mshr_workerunitofnotice]          INT              NULL,
    [mshr_employmentstartdate]         DATETIME2 (7)    NULL,
    [mshr_employmentenddate]           DATETIME2 (7)    NULL,
    [mshr_legalentityid]               NVARCHAR (MAX)   NULL,
    [mshr_personnelnumber]             NVARCHAR (MAX)   NULL,
    [mshr_reasoncodeid]                NVARCHAR (MAX)   NULL,
    [mshr_employmenttype]              INT              NULL,
    [mshr_employmenttypeid]            NVARCHAR (MAX)   NULL,
    [mshr_benefitemploymentstatus]     INT              NULL,
    [mshr_employmentcategoryid]        NVARCHAR (MAX)   NULL,
    [mshr_payfrequencyid]              NVARCHAR (MAX)   NULL,
    [mshr_primaryfield]                NVARCHAR (MAX)   NULL,
    [mshr_hcmemploymentdetailentityid] UNIQUEIDENTIFIER NULL
);

