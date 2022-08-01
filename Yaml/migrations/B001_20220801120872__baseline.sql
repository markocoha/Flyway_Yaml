SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
PRINT N'Creating [dbo].[Widget_Yamls]'
GO
CREATE TABLE [dbo].[Widget_Yamls]
(
[RecordID] [int] NOT NULL IDENTITY(1, 1),
[Description] [varchar] (50) NULL,
[SKU] [varchar] (20) NULL
)
GO
PRINT N'Creating primary key [PK_Widget_Yamls] on [dbo].[Widget_Yamls]'
GO
ALTER TABLE [dbo].[Widget_Yamls] ADD CONSTRAINT [PK_Widget_Yamls] PRIMARY KEY NONCLUSTERED ([RecordID])
GO
PRINT N'Creating [dbo].[Widget_YamlPrices]'
GO
CREATE TABLE [dbo].[Widget_YamlPrices]
(
[RecordID] [int] NOT NULL IDENTITY(1, 1),
[Widget_YamlID] [int] NULL,
[Price] [money] NULL,
[DateValidFrom] [datetime] NULL CONSTRAINT [DF_Widget_YamlPrices_DateValidFrom] DEFAULT (getdate()),
[DateValidTo] [datetime] NULL,
[Active] [char] (1) NULL CONSTRAINT [DF_Widget_YamlPrices_Active] DEFAULT ('N')
)
GO
PRINT N'Creating primary key [PK_Widget_YamlPrices] on [dbo].[Widget_YamlPrices]'
GO
ALTER TABLE [dbo].[Widget_YamlPrices] ADD CONSTRAINT [PK_Widget_YamlPrices] PRIMARY KEY NONCLUSTERED ([RecordID])
GO
PRINT N'Creating index [IX_Widget_YamlPrices_1] on [dbo].[Widget_YamlPrices]'
GO
CREATE NONCLUSTERED INDEX [IX_Widget_YamlPrices_1] ON [dbo].[Widget_YamlPrices] ([DateValidFrom])
GO
PRINT N'Creating index [IX_Widget_YamlPrices_2] on [dbo].[Widget_YamlPrices]'
GO
CREATE NONCLUSTERED INDEX [IX_Widget_YamlPrices_2] ON [dbo].[Widget_YamlPrices] ([DateValidTo])
GO
PRINT N'Creating index [IX_Widget_YamlPrices] on [dbo].[Widget_YamlPrices]'
GO
CREATE NONCLUSTERED INDEX [IX_Widget_YamlPrices] ON [dbo].[Widget_YamlPrices] ([Widget_YamlID])
GO
PRINT N'Creating [dbo].[CurrentPrices]'
GO
 
CREATE VIEW [dbo].[CurrentPrices]
AS
SELECT Widget_YamlPrices.Widget_YamlID, Widget_YamlPrices.Price, 
    Widget_Yamls.Description
FROM dbo.Widget_Yamls INNER JOIN
    dbo.Widget_YamlPrices ON 
    dbo.Widget_Yamls.RecordID = dbo.Widget_YamlPrices.Widget_YamlID
WHERE dbo.Widget_YamlPrices.Active = 'Y'
 
GO
PRINT N'Creating [dbo].[prcActivatePrices]'
GO
 
CREATE PROCEDURE [dbo].[prcActivatePrices]  AS
 
UPDATE Widget_YamlPrices SET Active='N' WHERE GetDate()<DateValidTo OR GetDate()>DateValidFrom
UPDATE Widget_YamlPrices SET Active='Y' WHERE GetDate()>=DateValidFrom OR GetDate()<=DateValidFrom
 
 
GO
PRINT N'Creating [dbo].[Widget_YamlDescriptions]'
GO
CREATE TABLE [dbo].[Widget_YamlDescriptions]
(
[Widget_YamlID] [int] NOT NULL IDENTITY(1, 1),
[Description] [varchar] (500) NULL,
[Widget_YamlName] [varchar] (50) NULL
)
GO
PRINT N'Creating [dbo].[Widget_YamlReferences]'
GO
CREATE TABLE [dbo].[Widget_YamlReferences]
(
[Widget_YamlID] [int] NOT NULL,
[Reference] [varchar] (50) NULL
)
GO
PRINT N'Creating primary key [PK_Widget_YamlReferences] on [dbo].[Widget_YamlReferences]'
GO
ALTER TABLE [dbo].[Widget_YamlReferences] ADD CONSTRAINT [PK_Widget_YamlReferences] PRIMARY KEY NONCLUSTERED ([Widget_YamlID])
GO
PRINT N'Adding foreign keys to [dbo].[Widget_YamlPrices]'
GO
ALTER TABLE [dbo].[Widget_YamlPrices] ADD CONSTRAINT [FK_Widget_YamlPrices_Widget_Yamls] FOREIGN KEY ([Widget_YamlID]) REFERENCES [dbo].[Widget_Yamls] ([RecordID])
GO
PRINT N'Altering permissions on  [dbo].[Widget_YamlPrices]'
GO
DENY DELETE ON  [dbo].[Widget_YamlPrices] TO [public]
GO
DENY INSERT ON  [dbo].[Widget_YamlPrices] TO [public]
GO
DENY REFERENCES ON  [dbo].[Widget_YamlPrices] TO [public]
GO
GRANT SELECT ON  [dbo].[Widget_YamlPrices] TO [public]
GO
DENY UPDATE ON  [dbo].[Widget_YamlPrices] TO [public]
GO
PRINT N'Altering permissions on  [dbo].[Widget_Yamls]'
GO
DENY DELETE ON  [dbo].[Widget_Yamls] TO [public]
GO
DENY INSERT ON  [dbo].[Widget_Yamls] TO [public]
GO
DENY REFERENCES ON  [dbo].[Widget_Yamls] TO [public]
GO
GRANT SELECT ON  [dbo].[Widget_Yamls] TO [public]
GO
DENY UPDATE ON  [dbo].[Widget_Yamls] TO [public]
GO
PRINT N'Altering permissions on  [dbo].[prcActivatePrices]'
GO
DENY EXECUTE ON  [dbo].[prcActivatePrices] TO [public]
GO
PRINT N'Altering permissions on  [dbo].[CurrentPrices]'
GO
DENY DELETE ON  [dbo].[CurrentPrices] TO [public]
GO
DENY INSERT ON  [dbo].[CurrentPrices] TO [public]
GO
GRANT SELECT ON  [dbo].[CurrentPrices] TO [public]
GO
DENY UPDATE ON  [dbo].[CurrentPrices] TO [public]
GO
