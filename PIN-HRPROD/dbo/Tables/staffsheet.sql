CREATE TABLE [dbo].[staffsheet] (
    [PERSONNELNUMBER]       NVARCHAR (25)  NOT NULL,
    [PARTYNUMBER]           NVARCHAR (40)  NOT NULL,
    [USEREMAIL]             NVARCHAR (255) NULL,
    [NAME]                  NVARCHAR (100) NOT NULL,
    [SD]                    DATETIME       NULL,
    [ED]                    DATETIME       NULL,
    [OFFICE_CUSTOM]         NVARCHAR (75)  NULL,
    [TEAM_CUSTOM]           NVARCHAR (75)  NULL,
    [FUNCTION_CUSTOM]       NVARCHAR (75)  NULL,
    [WORKERASSIGNMENTEND]   DATETIME       NULL,
    [WORKERASSIGNMENTSTART] DATETIME       NULL,
    [PED]                   DATE           NULL,
    [POSITIONID]            NVARCHAR (25)  NULL,
    [JOBTITLE]              NVARCHAR (100) NULL,
    [Functional_Title]      NVARCHAR (65)  NULL,
    [OFFICELOCATION]        NVARCHAR (255) NOT NULL,
    [BIRTHDATE]             DATETIME       NOT NULL,
    [PARENTPOSITIONID]      NVARCHAR (25)  NULL,
    [Manager_Name]          NVARCHAR (100) NULL,
    [Manager_email]         NVARCHAR (255) NULL,
    [Manager_JOB_TITLE]     NVARCHAR (100) NULL,
    [Action]                VARCHAR (50)   NULL,
    [Action_Date]           DATETIME       NULL,
    [DEPARTMENTNUMBER]      NVARCHAR (50)  NULL,
    [Dept_Name]             NVARCHAR (50)  NULL,
    [LOS]                   INT            NULL,
    [Originalhire]          DATETIME       NULL,
    [Latestdate]            DATETIME       NULL,
    [MNGR_HRIS_ID]          NVARCHAR (25)  NULL,
    [LEGALENTITY]           NVARCHAR (25)  NULL
);

