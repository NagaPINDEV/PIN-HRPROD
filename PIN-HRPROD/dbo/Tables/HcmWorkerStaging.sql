﻿CREATE TABLE [dbo].[HcmWorkerStaging] (
    [PRIMARYCONTACTEMAILPURPOSE]        NVARCHAR (1000)  NOT NULL,
    [PRIMARYCONTACTFAXPURPOSE]          NVARCHAR (1000)  NOT NULL,
    [PRIMARYCONTACTPHONEPURPOSE]        NVARCHAR (1000)  NOT NULL,
    [PRIMARYCONTACTURLPURPOSE]          NVARCHAR (1000)  NOT NULL,
    [BIRTHDATE]                         DATETIME         NOT NULL,
    [CITIZENSHIPCOUNTRYREGION]          NVARCHAR (50)    NOT NULL,
    [NATIONALITYCOUNTRYREGION]          NVARCHAR (10)    NOT NULL,
    [DECEASEDDATE]                      DATETIME         NOT NULL,
    [DISABLEDVERIFICATIONDATE]          DATETIME         NOT NULL,
    [EDUCATION]                         NVARCHAR (30)    NOT NULL,
    [ETHNICORIGINID]                    NVARCHAR (15)    NOT NULL,
    [FATHERBIRTHCOUNTRYREGION]          NVARCHAR (10)    NOT NULL,
    [GENDER]                            INT              NOT NULL,
    [ISDISABLED]                        INT              NOT NULL,
    [ISFULLTIMESTUDENT]                 INT              NOT NULL,
    [MOTHERBIRTHCOUNTRYREGION]          NVARCHAR (10)    NOT NULL,
    [NATIVELANGUAGEID]                  NVARCHAR (15)    NOT NULL,
    [PERSONBIRTHCOUNTRYREGION]          NVARCHAR (10)    NOT NULL,
    [PERSONBIRTHCITY]                   NVARCHAR (60)    NOT NULL,
    [ISDISABLEDVETERAN]                 INT              NOT NULL,
    [ISEXPATRIATERULINGAPPLICABLE]      INT              NOT NULL,
    [EXPATRIATERULINGVALIDFROM]         DATETIME         NOT NULL,
    [EXPATRIATERULINGVALIDTO]           DATETIME         NOT NULL,
    [MARITALSTATUS]                     INT              NOT NULL,
    [NUMBEROFDEPENDENTS]                INT              NOT NULL,
    [MILITARYSERVICESTARTDATE]          DATETIME         NOT NULL,
    [MILITARYSERVICEENDDATE]            DATETIME         NOT NULL,
    [VETERANSTATUSID]                   NVARCHAR (15)    NOT NULL,
    [ADDRESSBOOKS]                      NVARCHAR (1000)  NOT NULL,
    [ADDRESSPURPOSE]                    NVARCHAR (1000)  NOT NULL,
    [PARTYTYPE]                         NVARCHAR (13)    NOT NULL,
    [ELECTRONICLOCATIONID]              NVARCHAR (40)    NOT NULL,
    [ADDRESSNAMEDESCRIPTION]            NVARCHAR (60)    NOT NULL,
    [PRIMARYCONTACTFACEBOOKPURPOSE]     NVARCHAR (1000)  NOT NULL,
    [PRIMARYCONTACTLINKEDINPURPOSE]     NVARCHAR (1000)  NOT NULL,
    [PRIMARYCONTACTTWITTERPURPOSE]      NVARCHAR (1000)  NOT NULL,
    [WORKERTYPE]                        INT              NOT NULL,
    [WORKERSTATUS]                      INT              NOT NULL,
    [PERSONALTITLE]                     NVARCHAR (50)    NOT NULL,
    [PERSONALSUFFIX]                    NVARCHAR (50)    NOT NULL,
    [ADDRESSCOUNTRYREGIONISOCODE]       NVARCHAR (2)     NOT NULL,
    [OFFICELOCATION]                    NVARCHAR (255)   NOT NULL,
    [OBJECTID]                          UNIQUEIDENTIFIER NOT NULL,
    [ALLOWREHIRE]                       INT              NOT NULL,
    [DEFINITIONGROUP]                   NVARCHAR (60)    NOT NULL,
    [EXECUTIONID]                       NVARCHAR (90)    NOT NULL,
    [ISSELECTED]                        INT              NOT NULL,
    [TRANSFERSTATUS]                    INT              NOT NULL,
    [PERSONNELNUMBER]                   NVARCHAR (25)    NOT NULL,
    [PARTYNUMBER]                       NVARCHAR (40)    NOT NULL,
    [KNOWNAS]                           NVARCHAR (100)   NOT NULL,
    [LANGUAGEID]                        NVARCHAR (7)     NOT NULL,
    [NAME]                              NVARCHAR (100)   NOT NULL,
    [NAMEALIAS]                         NVARCHAR (20)    NOT NULL,
    [PHONETICFIRSTNAME]                 NVARCHAR (25)    NOT NULL,
    [PHONETICLASTNAME]                  NVARCHAR (25)    NOT NULL,
    [PHONETICMIDDLENAME]                NVARCHAR (25)    NOT NULL,
    [PRIMARYADDRESSLOCATION]            BIGINT           NOT NULL,
    [PRIMARYCONTACTEMAIL]               NVARCHAR (255)   NOT NULL,
    [PRIMARYCONTACTEMAILDESCRIPTION]    NVARCHAR (60)    NOT NULL,
    [PRIMARYCONTACTEMAILISIM]           INT              NOT NULL,
    [PRIMARYCONTACTEMAILISPRIVATE]      INT              NOT NULL,
    [PRIMARYCONTACTFAX]                 NVARCHAR (255)   NOT NULL,
    [PRIMARYCONTACTFAXDESCRIPTION]      NVARCHAR (60)    NOT NULL,
    [PRIMARYCONTACTFAXEXTENSION]        NVARCHAR (10)    NOT NULL,
    [PRIMARYCONTACTFAXISPRIVATE]        INT              NOT NULL,
    [PRIMARYCONTACTPHONE]               NVARCHAR (255)   NOT NULL,
    [PRIMARYCONTACTPHONEDESCRIPTION]    NVARCHAR (60)    NOT NULL,
    [PRIMARYCONTACTPHONEEXTENSION]      NVARCHAR (10)    NOT NULL,
    [PRIMARYCONTACTPHONEISMOBILE]       INT              NOT NULL,
    [PRIMARYCONTACTPHONEISPRIVATE]      INT              NOT NULL,
    [PRIMARYCONTACTURL]                 NVARCHAR (255)   NOT NULL,
    [PRIMARYCONTACTURLDESCRIPTION]      NVARCHAR (60)    NOT NULL,
    [PRIMARYCONTACTURLISPRIVATE]        INT              NOT NULL,
    [PRIMARYCONTACTFACEBOOK]            NVARCHAR (255)   NOT NULL,
    [PRIMARYCONTACTFACEBOOKDESCRIPTION] NVARCHAR (60)    NOT NULL,
    [PRIMARYCONTACTFACEBOOKISPRIVATE]   INT              NOT NULL,
    [PRIMARYCONTACTLINKEDIN]            NVARCHAR (255)   NOT NULL,
    [PRIMARYCONTACTLINKEDINDESCRIPTION] NVARCHAR (60)    NOT NULL,
    [PRIMARYCONTACTLINKEDINISPRIVATE]   INT              NOT NULL,
    [PRIMARYCONTACTTWITTER]             NVARCHAR (255)   NOT NULL,
    [PRIMARYCONTACTTWITTERISPRIVATE]    INT              NOT NULL,
    [PRIMARYCONTACTTWITTERDESCRIPTION]  NVARCHAR (60)    NOT NULL,
    [PROFESSIONALSUFFIX]                NVARCHAR (50)    NOT NULL,
    [PROFESSIONALTITLE]                 NVARCHAR (50)    NOT NULL,
    [TITLEID]                           NVARCHAR (65)    NOT NULL,
    [ORIGINALHIREDATETIME]              DATETIME         NOT NULL,
    [SENIORITYDATE]                     DATETIME         NOT NULL,
    [ANNIVERSARYDATETIME]               DATETIME         NOT NULL,
    [OFFICELOCATIONID]                  NVARCHAR (40)    NOT NULL,
    [SUMMARYVALIDFROM]                  DATETIME         NOT NULL,
    [SUMMARYVALIDTO]                    DATETIME         NOT NULL,
    [PERSONDETAILSVALIDFROM]            DATETIME         NOT NULL,
    [PERSONDETAILSVALIDTO]              DATETIME         NOT NULL,
    [ADDRESSCITY]                       NVARCHAR (60)    NOT NULL,
    [ADDRESSCOUNTRYREGIONID]            NVARCHAR (10)    NOT NULL,
    [ADDRESSCOUNTY]                     NVARCHAR (30)    NOT NULL,
    [ADDRESSDISTRICTNAME]               NVARCHAR (60)    NOT NULL,
    [ADDRESSLOCATIONID]                 NVARCHAR (40)    NOT NULL,
    [ADDRESSSTATE]                      NVARCHAR (10)    NOT NULL,
    [ADDRESSSTREET]                     NVARCHAR (250)   NOT NULL,
    [ADDRESSZIPCODE]                    NVARCHAR (10)    NOT NULL,
    [ADDRESSVALIDFROM]                  DATETIME         NOT NULL,
    [ADDRESSVALIDTO]                    DATETIME         NOT NULL,
    [FIRSTNAME]                         NVARCHAR (25)    NOT NULL,
    [MIDDLENAME]                        NVARCHAR (25)    NOT NULL,
    [LASTNAMEPREFIX]                    NVARCHAR (25)    NOT NULL,
    [LASTNAME]                          NVARCHAR (25)    NOT NULL,
    [NAMESEQUENCEDISPLAYAS]             NVARCHAR (20)    NOT NULL,
    [WORKSFROMHOME]                     INT              NOT NULL,
    [ADDEDFIELDS]                       NVARCHAR (MAX)   NULL,
    [PARTITION]                         NVARCHAR (20)    NOT NULL,
    [USER_]                             NVARCHAR (50)    NOT NULL,
    [PERSONUSERVALIDFROM]               DATETIME         NOT NULL,
    [PERSONUSERVALIDTO]                 DATETIME         NOT NULL,
    [IDENTITYEMAIL]                     NVARCHAR (255)   NOT NULL,
    [IDENTITYPROVIDER]                  NVARCHAR (255)   NOT NULL,
    [CAREERTRACK_CUSTOM]                NVARCHAR (75)    NOT NULL,
    [ASSIGNMENTS_CUSTOM]                NVARCHAR (100)   NOT NULL,
    [GENDEROTHER_CUSTOM]                NVARCHAR (100)   NOT NULL,
    [MEDICAL_CUSTOM]                    NVARCHAR (100)   NOT NULL,
    [OTHERRELIGION_CUSTOM]              NVARCHAR (100)   NOT NULL,
    [RELIGION_CUSTOM]                   NVARCHAR (75)    NOT NULL,
    [SEXUALORIENTATIONOTHER_CUSTOM]     NVARCHAR (100)   NOT NULL,
    [SEXUALORIENTATIONV2_CUSTOM]        NVARCHAR (75)    NOT NULL,
    [EEOARMY_CUSTOM]                    NVARCHAR (75)    NOT NULL,
    [EEOCOLLEGE_CUSTOM]                 NVARCHAR (75)    NOT NULL,
    [EEOGENDER_CUSTOM]                  NVARCHAR (75)    NOT NULL,
    [EEORACE_CUSTOM]                    NVARCHAR (75)    NOT NULL,
    [EEORELIGION_CUSTOM]                NVARCHAR (75)    NOT NULL,
    [EEOSEXUALORIENTATION_CUSTOM]       NVARCHAR (75)    NOT NULL,
    [EEOTRANS_CUSTOM]                   NVARCHAR (75)    NOT NULL,
    [LANGUAGESOTHER_CUSTOM]             NVARCHAR (100)   NOT NULL,
    [RACEOTHER_CUSTOM]                  NVARCHAR (100)   NOT NULL,
    [EEOCAREADULT_CUSTOM]               NVARCHAR (75)    NOT NULL,
    [EEOCAREPOC_CUSTOM]                 NVARCHAR (75)    NOT NULL,
    [FEEEARNER_CUSTOM]                  INT              NOT NULL,
    [SYNCSTARTDATETIME]                 DATETIME         NOT NULL,
    [RECID]                             BIGINT           NOT NULL,
    CONSTRAINT [PK_HcmWorkerStaging] PRIMARY KEY CLUSTERED ([EXECUTIONID] ASC, [PERSONNELNUMBER] ASC, [PARTITION] ASC)
);
