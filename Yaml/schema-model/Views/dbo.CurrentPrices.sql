SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
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
DENY DELETE ON  [dbo].[CurrentPrices] TO [public]
GO
DENY INSERT ON  [dbo].[CurrentPrices] TO [public]
GO
GRANT SELECT ON  [dbo].[CurrentPrices] TO [public]
GO
DENY UPDATE ON  [dbo].[CurrentPrices] TO [public]
GO
