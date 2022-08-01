CREATE TABLE [dbo].[Widget_Yamls]
(
[RecordID] [int] NOT NULL IDENTITY(1, 1),
[Description] [varchar] (50) NULL,
[SKU] [varchar] (20) NULL
)
GO
ALTER TABLE [dbo].[Widget_Yamls] ADD CONSTRAINT [PK_Widget_Yamls] PRIMARY KEY NONCLUSTERED ([RecordID])
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
