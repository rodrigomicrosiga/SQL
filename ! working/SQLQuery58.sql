/****** Script for SelectTopNRows command from SSMS  ******/
SELECT dimperson.NAME
	, count(*)
FROM [tfs_warehouse].[dbo].[DimChangeset]
INNER JOIN [tfs_warehouse].[dbo].dimperson ON DimChangeset.CheckedInBySK = dimperson.personsk
WHERE [DimChangeset].[LastUpdatedDateTime] > '8/1/2013'
GROUP BY dimperson.NAME
