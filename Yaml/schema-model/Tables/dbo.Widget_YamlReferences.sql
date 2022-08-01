CREATE TABLE [dbo].[Widget_YamlReferences]
(
[Widget_YamlID] [int] NOT NULL,
[Reference] [varchar] (50) NULL
)
GO
ALTER TABLE [dbo].[Widget_YamlReferences] ADD CONSTRAINT [PK_Widget_YamlReferences] PRIMARY KEY NONCLUSTERED ([Widget_YamlID])
GO
