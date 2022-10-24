CREATE TABLE [dbo].[Placement_Integrator] (
    [Title]                 VARCHAR (256)  NULL,
    [Vacancy_ID]            VARCHAR (256)  NULL,
    [Placement_ID]          VARCHAR (256)  NULL,
    [Consultant_ID]         VARCHAR (256)  NULL,
    [Candidate_ID]          VARCHAR (256)  NULL,
    [Manager_Contact_ID]    VARCHAR (256)  NULL,
    [Candidate_Name]        VARCHAR (256)  NULL,
    [HRIS_Personnel_Number] VARCHAR (256)  NULL,
    [Worker_Created]        INT            NULL,
    [Employment_Created]    INT            NULL,
    [Position_Assigned]     INT            NULL,
    [IR_Complete]           INT            DEFAULT ((0)) NULL,
    [Worker_GUID]           NVARCHAR (256) NULL,
    [Email_Sent]            INT            DEFAULT ((0)) NULL,
    [Error_Occured]         INT            NULL,
    [SuccesfullStart]       INT            NULL,
    [Error_Msg]             NVARCHAR (512) NULL
);

