﻿CREATE TABLE [hr].[stg_tblcdmworkeraddress] (
    [cdm_addressnumber]          NVARCHAR (MAX)   NULL,
    [cdm_addresstype]            INT              NULL,
    [cdm_city]                   NVARCHAR (MAX)   NULL,
    [cdm_countryregion]          NVARCHAR (MAX)   NULL,
    [cdm_county]                 NVARCHAR (MAX)   NULL,
    [cdm_description]            NVARCHAR (MAX)   NULL,
    [cdm_effectivedate]          DATETIME2 (7)    NULL,
    [cdm_fax]                    NVARCHAR (MAX)   NULL,
    [cdm_ispreferred]            BIT              NULL,
    [cdm_latitude]               DECIMAL (38, 18) NULL,
    [cdm_line1]                  NVARCHAR (MAX)   NULL,
    [cdm_line2]                  NVARCHAR (MAX)   NULL,
    [cdm_line3]                  NVARCHAR (MAX)   NULL,
    [cdm_longitude]              DECIMAL (38, 18) NULL,
    [cdm_postalcode]             NVARCHAR (MAX)   NULL,
    [cdm_postofficebox]          NVARCHAR (MAX)   NULL,
    [cdm_shippingmethodcode]     INT              NULL,
    [cdm_stateorprovince]        NVARCHAR (MAX)   NULL,
    [cdm_street]                 NVARCHAR (MAX)   NULL,
    [cdm_streetnumber]           NVARCHAR (MAX)   NULL,
    [cdm_telephone1]             NVARCHAR (MAX)   NULL,
    [cdm_telephone2]             NVARCHAR (MAX)   NULL,
    [cdm_telephone3]             NVARCHAR (MAX)   NULL,
    [cdm_upszone]                NVARCHAR (MAX)   NULL,
    [cdm_utcoffset]              INT              NULL,
    [cdm_workeraddressid]        UNIQUEIDENTIFIER NULL,
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

