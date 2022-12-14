CREATE TABLE [hr].[stg_tblcdmpersonidentificationissuingagency] (
    [cdm_addressdescription]                  NVARCHAR (MAX)   NULL,
    [cdm_addressline1]                        NVARCHAR (MAX)   NULL,
    [cdm_addressline2]                        NVARCHAR (MAX)   NULL,
    [cdm_addressline3]                        NVARCHAR (MAX)   NULL,
    [cdm_city]                                NVARCHAR (MAX)   NULL,
    [cdm_countryregion]                       INT              NULL,
    [cdm_county]                              NVARCHAR (MAX)   NULL,
    [cdm_description]                         NVARCHAR (MAX)   NULL,
    [cdm_email]                               NVARCHAR (MAX)   NULL,
    [cdm_extension]                           NVARCHAR (MAX)   NULL,
    [cdm_fax]                                 NVARCHAR (MAX)   NULL,
    [cdm_mobilephone]                         NVARCHAR (MAX)   NULL,
    [cdm_name]                                NVARCHAR (MAX)   NULL,
    [cdm_pager]                               NVARCHAR (MAX)   NULL,
    [cdm_personidentificationissuingagencyid] UNIQUEIDENTIFIER NULL,
    [cdm_postalcode]                          NVARCHAR (MAX)   NULL,
    [cdm_postofficebox]                       NVARCHAR (MAX)   NULL,
    [cdm_sms]                                 NVARCHAR (MAX)   NULL,
    [cdm_stateorprovince]                     NVARCHAR (MAX)   NULL,
    [cdm_street]                              NVARCHAR (MAX)   NULL,
    [cdm_telephone]                           NVARCHAR (MAX)   NULL,
    [cdm_telex]                               NVARCHAR (MAX)   NULL,
    [cdm_websiteurl]                          NVARCHAR (MAX)   NULL,
    [createdby]                               UNIQUEIDENTIFIER NULL,
    [createdbyname]                           NVARCHAR (MAX)   NULL,
    [createdbyyominame]                       NVARCHAR (MAX)   NULL,
    [createdon]                               DATETIME2 (7)    NULL,
    [createdonbehalfby]                       UNIQUEIDENTIFIER NULL,
    [createdonbehalfbyname]                   NVARCHAR (MAX)   NULL,
    [createdonbehalfbyyominame]               NVARCHAR (MAX)   NULL,
    [importsequencenumber]                    INT              NULL,
    [modifiedby]                              UNIQUEIDENTIFIER NULL,
    [modifiedbyname]                          NVARCHAR (MAX)   NULL,
    [modifiedbyyominame]                      NVARCHAR (MAX)   NULL,
    [modifiedon]                              DATETIME2 (7)    NULL,
    [modifiedonbehalfby]                      UNIQUEIDENTIFIER NULL,
    [modifiedonbehalfbyname]                  NVARCHAR (MAX)   NULL,
    [modifiedonbehalfbyyominame]              NVARCHAR (MAX)   NULL,
    [overriddencreatedon]                     DATETIME2 (7)    NULL,
    [ownerid]                                 UNIQUEIDENTIFIER NULL,
    [owneridname]                             NVARCHAR (MAX)   NULL,
    [owneridtype]                             NVARCHAR (MAX)   NULL,
    [owneridyominame]                         NVARCHAR (MAX)   NULL,
    [owningbusinessunit]                      UNIQUEIDENTIFIER NULL,
    [owningbusinessunitname]                  NVARCHAR (MAX)   NULL,
    [owningteam]                              UNIQUEIDENTIFIER NULL,
    [owninguser]                              UNIQUEIDENTIFIER NULL,
    [statecode]                               INT              NULL,
    [statuscode]                              INT              NULL,
    [timezoneruleversionnumber]               INT              NULL,
    [utcconversiontimezonecode]               INT              NULL,
    [versionnumber]                           BIGINT           NULL
);

