CREATE TABLE [dbo].[DevicesWithInventory] (
    [Device_name]                NVARCHAR (50)  NOT NULL,
    [OS_version]                 NVARCHAR (50)  NOT NULL,
    [Azure_AD_registered]        BIT            NULL,
    [Manufacturer]               NVARCHAR (50)  NOT NULL,
    [Model]                      NVARCHAR (50)  NOT NULL,
    [Primary_user_UPN]           NVARCHAR (100) NULL,
    [Primary_user_email_address] NVARCHAR (100) NULL,
    [Primary_user_display_name]  NVARCHAR (50)  NULL,
    [Compliance]                 NVARCHAR (50)  NOT NULL,
    [Managed_by]                 NVARCHAR (50)  NOT NULL,
    [Ownership]                  NVARCHAR (50)  NOT NULL,
    [Device_state]               NVARCHAR (50)  NOT NULL,
    [Intune_registered]          NVARCHAR (50)  NOT NULL,
    [Supervised]                 BIT            NOT NULL,
    [Encrypted]                  BIT            NOT NULL,
    [OS]                         NVARCHAR (50)  NOT NULL,
    [SkuFamily]                  NVARCHAR (50)  NULL,
    [JoinType]                   NVARCHAR (50)  NOT NULL
);

