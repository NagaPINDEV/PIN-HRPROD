CREATE TABLE [hr].[mshr_hcmworkercontactv2entity] (
    [mshr_personnelnumber]            NVARCHAR (MAX)   NULL,
    [mshr_type]                       INT              NULL,
    [mshr_locator]                    NVARCHAR (MAX)   NULL,
    [mshr_description]                NVARCHAR (MAX)   NULL,
    [mshr_purpose]                    NVARCHAR (MAX)   NULL,
    [mshr_locatorextension]           NVARCHAR (MAX)   NULL,
    [mshr_countryregioncode]          NVARCHAR (MAX)   NULL,
    [mshr_isprimary]                  INT              NULL,
    [mshr_ismobilephone]              INT              NULL,
    [mshr_isprivate]                  INT              NULL,
    [mshr_locationid]                 NVARCHAR (MAX)   NULL,
    [mshr_primaryfield]               NVARCHAR (MAX)   NULL,
    [mshr_hcmworkercontactv2entityid] UNIQUEIDENTIFIER NULL
);

