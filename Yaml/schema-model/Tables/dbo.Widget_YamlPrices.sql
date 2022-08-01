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
ALTER TABLE [dbo].[Widget_YamlPrices] ADD CONSTRAINT [PK_Widget_YamlPrices] PRIMARY KEY NONCLUSTERED ([RecordID])
GO
CREATE NONCLUSTERED INDEX [IX_Widget_YamlPrices_1] ON [dbo].[Widget_YamlPrices] ([DateValidFrom])
GO
CREATE NONCLUSTERED INDEX [IX_Widget_YamlPrices_2] ON [dbo].[Widget_YamlPrices] ([DateValidTo])
GO
CREATE NONCLUSTERED INDEX [IX_Widget_YamlPrices] ON [dbo].[Widget_YamlPrices] ([Widget_YamlID])
GO
ALTER TABLE [dbo].[Widget_YamlPrices] ADD CONSTRAINT [FK_Widget_YamlPrices_Widget_Yamls] FOREIGN KEY ([Widget_YamlID]) REFERENCES [dbo].[Widget_Yamls] ([RecordID])
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
