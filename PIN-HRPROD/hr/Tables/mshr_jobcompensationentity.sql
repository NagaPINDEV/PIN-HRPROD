CREATE TABLE [hr].[mshr_jobcompensationentity] (
    [mshr_marketcontrolpay]           DECIMAL (38, 18) NULL,
    [mshr_marketmaximumpay]           DECIMAL (38, 18) NULL,
    [mshr_marketminimumpay]           DECIMAL (38, 18) NULL,
    [mshr_marketsource]               NVARCHAR (MAX)   NULL,
    [mshr_externalsurveycode]         NVARCHAR (MAX)   NULL,
    [mshr_jobid]                      NVARCHAR (MAX)   NULL,
    [mshr_compensationlevelid]        NVARCHAR (MAX)   NULL,
    [mshr_surveycompanyid]            NVARCHAR (MAX)   NULL,
    [mshr_primaryfield]               NVARCHAR (MAX)   NULL,
    [mshr_hcmjobcompensationentityid] UNIQUEIDENTIFIER NULL
);

