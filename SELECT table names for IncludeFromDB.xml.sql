SET NOCOUNT ON

SELECT  '<Table>iCCG.' + name + '</Table>'
FROM    sys.tables
WHERE   name NOT LIKE 'spt%'
        AND name NOT IN ('MSreplication_options', 'sysdiagrams')
        AND schema_id = 7
ORDER BY name

--SELECT * FROM sys.tables ORDER BY name

--DROP TABLE RefCaseGLSectionStatusType