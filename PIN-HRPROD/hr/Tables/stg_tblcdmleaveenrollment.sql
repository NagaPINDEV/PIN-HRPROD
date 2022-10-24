﻿CREATE TABLE [hr].[stg_tblcdmleaveenrollment] (
    [cdm_accrualdatebasis]       DATETIME2 (7)    NULL,
    [cdm_accrualstartdate]       DATETIME2 (7)    NULL,
    [cdm_companyid]              UNIQUEIDENTIFIER NULL,
    [cdm_companyidname]          NVARCHAR (MAX)   NULL,
    [cdm_customdate]             DATETIME2 (7)    NULL,
    [cdm_enddate]                DATETIME2 (7)    NULL,
    [cdm_isaccrualsuspended]     BIT              NULL,
    [cdm_leaveenrollmentid]      UNIQUEIDENTIFIER NULL,
    [cdm_leaveenrollmentnumber]  NVARCHAR (MAX)   NULL,
    [cdm_leaveplanid]            UNIQUEIDENTIFIER NULL,
    [cdm_leaveplanidname]        NVARCHAR (MAX)   NULL,
    [cdm_startdate]              DATETIME2 (7)    NULL,
    [cdm_tierbasis]              INT              NULL,
    [cdm_workerid]               UNIQUEIDENTIFIER NULL,
    [cdm_workeridname]           NVARCHAR (MAX)   NULL,
    [createdby]                  UNIQUEIDENTIFIER NULL,
    [createdbyname]              NVARCHAR (MAX)   NULL,
    [createdbyyominame]          NVARCHAR (MAX)   NULL,
    [createdon]                  DATETIME2 (7)    NULL,
    [createdonbehalfby]          UNIQUEIDENTIFIER NULL,
    [createdonbehalfbyname]      NVARCHAR (MAX)   NULL,
    [createdonbehalfbyyominame]  NVARCHAR (MAX)   NULL,
    [importsequencenumber]       INT              NULL,
    [modifiedby]                 UNIQUEIDENTIFIER NULL,
    [modifiedbyname]             NVARCHAR (MAX)   NULL,
    [modifiedbyyominame]         NVARCHAR (MAX)   NULL,
    [modifiedon]                 DATETIME2 (7)    NULL,
    [modifiedonbehalfby]         UNIQUEIDENTIFIER NULL,
    [modifiedonbehalfbyname]     NVARCHAR (MAX)   NULL,
    [modifiedonbehalfbyyominame] NVARCHAR (MAX)   NULL,
    [overriddencreatedon]        DATETIME2 (7)    NULL,
    [ownerid]                    UNIQUEIDENTIFIER NULL,
    [owneridname]                NVARCHAR (MAX)   NULL,
    [owneridtype]                NVARCHAR (MAX)   NULL,
    [owneridyominame]            NVARCHAR (MAX)   NULL,
    [owningbusinessunit]         UNIQUEIDENTIFIER NULL,
    [owningbusinessunitname]     NVARCHAR (MAX)   NULL,
    [owningteam]                 UNIQUEIDENTIFIER NULL,
    [owninguser]                 UNIQUEIDENTIFIER NULL,
    [statecode]                  INT              NULL,
    [statuscode]                 INT              NULL,
    [timezoneruleversionnumber]  INT              NULL,
    [utcconversiontimezonecode]  INT              NULL,
    [versionnumber]              BIGINT           NULL
);

