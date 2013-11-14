IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_NAME = 'Tool_ScriptDiagram2005')
BEGIN
	DROP PROCEDURE dbo.Tool_ScriptDiagram2005
END
GO
/**
<summary>
Script Sql Server 2005 diagrams
(inspired by usp_ScriptDatabaseDiagrams for Sql Server 2000 by Clay Beatty)
</summary>
<example>
--NOTE: Scalar-valued Function [Tool_VarbinaryToVarcharHex] must exist before this script is run
EXEC Tool_ScriptDiagram2005 'DatabaseName'
</example>
<author>Craig Dunn</author>
<remarks>
Helpful Articles
----------------
1) Upload / Download to Sql 2005
http://staceyw.spaces.live.com/blog/cns!F4A38E96E598161E!404.entry

2) MSDN: Using Large-Value Data Types
http://msdn2.microsoft.com/en-us/library/ms178158.aspx

3) "original" Script, Save, Export SQL 2000 Database Diagrams
http://www.thescripts.com/forum/thread81534.html
http://groups-beta.google.com/group/comp.databases.ms-sqlserver/browse_frm/thread/ca9a9229d06a56f9?dq=&hl=en&lr=&ie=UTF-8&oe=UTF-8&prev=/groups%3Fdq%3D%26num%3D25%26hl%3Den%26lr%3D%26ie%3DUTF-8%26oe%3DUTF-8%26group%3Dcomp.databases.ms-sqlserver%26start%3D25
</remarks>
<param name="name">Name of the diagram in the Sql Server database instance</param>
*/
CREATE PROCEDURE dbo.Tool_ScriptDiagram2005
(
	@name VARCHAR(128)
)
AS
BEGIN
	DECLARE @diagram_id		INT
	DECLARE @index			INT
	DECLARE @size			INT
	DECLARE @chunk			INT
	DECLARE @line			VARCHAR(max)
	-- Set start index, and chunk 'constant' value
	SET @index = 1  -- 
	SET @chunk = 32	-- values that work: 2, 6
					-- values that fail: 15,16, 64
	-- Get PK diagram_id using the diagram's name (which is what the user is familiar with)
	SELECT 
		@diagram_id=diagram_id	
	,	@size = DATALENGTH(definition) 
	FROM sysdiagrams 
	WHERE [name] = @name

	IF @diagram_id IS NULL
	BEGIN
		PRINT '/**<error>
Diagram name [' + @name + '] could not be found.
</error>*/' 
	END
	ELSE -- Diagram exists
	BEGIN
		-- Now with the diagram_id, do all the work
		PRINT '/**'
		PRINT '<summary>'
		PRINT 'Restore diagram ''' + @name + ''''
		PRINT '</summary>'
		PRINT '<remarks>'
		PRINT 'Generated by Tool_ScriptDiagram2005/Tool_VarbinaryToVarcharHex'
		PRINT 'Will attempt to create [sysdiagrams] table if it doesn''t already exist'
		PRINT '</remarks>'
		PRINT '<generated>' + LEFT(CONVERT(VARCHAR(23), GETDATE(), 121), 16) + '</generated>'
		PRINT '*/'
		PRINT 'PRINT ''=== Tool_ScriptDiagram2005 restore diagram [' + @name + '] ==='''
		PRINT '	-- If the sysdiagrams table has not been created in this database, create it!
				IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = ''sysdiagrams'')
				BEGIN
					-- Create table script generated by Sql Server Management Studio
					-- _Assume_ this is roughly equivalent to what Sql Server/Management Studio
					-- creates the first time you add a diagram to a 2005 database
					CREATE TABLE [dbo].[sysdiagrams](
						[name] [sysname] NOT NULL,
						[principal_id] [int] NOT NULL,
						[diagram_id] [int] IDENTITY(1,1) NOT NULL,
						[version] [int] NULL,
						[definition] [varbinary](max) NULL,
					PRIMARY KEY CLUSTERED 
					(
						[diagram_id] ASC
					)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ,
					 CONSTRAINT [UK_principal_name] UNIQUE NONCLUSTERED 
					(
						[principal_id] ASC,
						[name] ASC
					)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) 
					) 
					EXEC sys.sp_addextendedproperty @name=N''microsoft_database_tools_support'', @value=1 , @level0type=N''SCHEMA'',@level0name=N''dbo'', @level1type=N''TABLE'',@level1name=N''sysdiagrams''
					PRINT ''[sysdiagrams] table was created as it did not already exist''
				END
				-- Target table will now exist, if it didn''t before'
		PRINT 'SET NOCOUNT ON -- Hide (1 row affected) messages'
		PRINT 'DECLARE @newid INT'
		PRINT 'DECLARE @DiagramSuffix          varchar (50)'
		PRINT ''
		PRINT 'PRINT ''Suffix diagram name with date, to ensure uniqueness'''	
		PRINT 'SET @DiagramSuffix = '' '' + LEFT(CONVERT(VARCHAR(23), GETDATE(), 121), 16)'
		PRINT ''
		PRINT 'PRINT ''Create row for new diagram'''
		-- Output the INSERT that _creates_ the diagram record, with a non-NULL [definition],
		-- important because .WRITE *cannot* be called against a NULL value (in the WHILE loop)
		-- so we insert 0x so that .WRITE has 'something' to append to...
		PRINT 'BEGIN TRY'
		PRINT '    PRINT ''Write diagram ' + @name + ' into new row (and get [diagram_id])'''
		SELECT @line =  
			  '    INSERT INTO sysdiagrams ([name], [principal_id], [version], [definition])'
			+ ' VALUES (''' + [name] + '''+@DiagramSuffix, '+ CAST (principal_id AS VARCHAR(100))+', '+CAST (version AS VARCHAR(100))+', 0x)'
		FROM sysdiagrams WHERE diagram_id = @diagram_id
		PRINT @line
		PRINT '    SET @newid = SCOPE_IDENTITY()'
		PRINT 'END TRY'
		PRINT 'BEGIN CATCH'
		PRINT '    PRINT ''XxXxX '' + Error_Message() + '' XxXxX'''
		PRINT '    PRINT ''XxXxX END Tool_ScriptDiagram2005 - fix the error before running again XxXxX'''
		PRINT '    RETURN'
		PRINT 'END CATCH'
		PRINT ''
		PRINT 'PRINT ''Now add all the binary data...'''
		PRINT 'BEGIN TRY'
		WHILE @index < @size
		BEGIN
			-- Output as many UPDATE statements as required to append all the diagram binary
			-- data, represented as hexadecimal strings
			SELECT @line =  
				 '    UPDATE sysdiagrams SET [definition] .Write ('
				+ ' 0x' + UPPER(dbo.Tool_VarbinaryToVarcharHex (SUBSTRING (definition, @index, @chunk)))
				+ ', null, 0) WHERE diagram_id = @newid -- index:' + CAST(@index AS VARCHAR(100))
			FROM	sysdiagrams 
			WHERE	diagram_id = @diagram_id
			PRINT @line
			SET @index = @index + @chunk
		END
		PRINT ''
		PRINT '    PRINT ''=== Finished writing diagram id '' + CAST(@newid AS VARCHAR(100)) + ''  ==='''
		PRINT '    PRINT ''=== Refresh your Databases-[DbName]-Database Diagrams to see the new diagram ==='''
		PRINT 'END TRY'
		PRINT 'BEGIN CATCH'
		PRINT '    -- If we got here, the [definition] updates didn''t complete, so delete the diagram row'
		PRINT '    -- (and hope it doesn''t fail!)'
		PRINT '    DELETE FROM sysdiagrams WHERE diagram_id = @newid'
		PRINT '    PRINT ''XxXxX '' + Error_Message() + '' XxXxX'''
		PRINT '    PRINT ''XxXxX END Tool_ScriptDiagram2005 - fix the error before running again XxXxX'''
		PRINT '    RETURN'
		PRINT 'END CATCH'
	END
END