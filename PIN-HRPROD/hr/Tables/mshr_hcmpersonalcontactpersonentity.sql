CREATE TABLE [hr].[mshr_hcmpersonalcontactpersonentity] (
    [mshr_workerpersonnelnumber]              NVARCHAR (MAX)   NULL,
    [mshr_contactpersonpartynumber]           NVARCHAR (MAX)   NULL,
    [mshr_relationshiptype]                   NVARCHAR (MAX)   NULL,
    [mshr_relationshipvalidfrom]              DATETIME2 (7)    NULL,
    [mshr_relationshipvalidto]                DATETIME2 (7)    NULL,
    [mshr_contactfirstname]                   NVARCHAR (MAX)   NULL,
    [mshr_contactmiddlename]                  NVARCHAR (MAX)   NULL,
    [mshr_contactlastnameprefix]              NVARCHAR (MAX)   NULL,
    [mshr_contactlastname]                    NVARCHAR (MAX)   NULL,
    [mshr_isbeneficiary]                      INT              NULL,
    [mshr_isemergencycontact]                 INT              NULL,
    [mshr_emergencycontactprimarysecondary]   INT              NULL,
    [mshr_isdependent]                        INT              NULL,
    [mshr_isdependentcourtordered]            INT              NULL,
    [mshr_isdependentdomesticpartnerverified] INT              NULL,
    [mshr_gender]                             INT              NULL,
    [mshr_isfulltimestudent]                  INT              NULL,
    [mshr_isdisabled]                         INT              NULL,
    [mshr_primaryfield]                       NVARCHAR (MAX)   NULL,
    [mshr_hcmpersonalcontactpersonentityid]   UNIQUEIDENTIFIER NULL
);

