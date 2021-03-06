/****** Object:  StoredProcedure [dbo].[RefStateRetrieveAll]    Script Date: 04/08/2011 13:35:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[RefStateRetrieveAll]
    (
     @WorkflowName VARCHAR(100),
     @Debug BIT = 0
    )
AS /************************************************
* CareWebQI
* NAME		: RefStateRetrieveAll
* AUTHOR  	: (generated)
* DATE		: 2/16/2011
* LAST REV	: 2/16/2011
*
* PURPOSE:	Selects all RefState records.
*
* TABLES USED:  RefState
*
* PARAMETERS IN:
* 		Debug				- Flag for debug printing
*
* RETURNS:
* 		 0	- Successful
* 		-1	- Generic failure
*
*****************************************************
* REVISION HISTORY:
*
*****************************************************
*/
    BEGIN

        DECLARE @errCode INT ;
        DECLARE @procName VARCHAR(50) ;

        SET @errCode = 0 ;
        SET @procName = 'RefStateRetrieveAll' ;

        IF @Debug = 1 
            BEGIN
                PRINT @procName + ': Selecting all [RefState] records...' ;
            END

        SELECT  rf.StateID,
                rf.StateName,
                rf.Description
        FROM    RefState rf
                INNER JOIN RefWorkflow rw ON rw.WorkflowID = rf.WorkflowID
        WHERE   rw.WorkflowName = @WorkflowName
                AND rw.Active = 1
                AND rf.Active = 1 ;

        SELECT  @errCode = @errCode + @@ERROR ;

        IF @errCode <> 0 
            RETURN -1 ;
        ELSE 
            RETURN 0 ;

    END




/****** Object:  StoredProcedure [dbo].[RefStateRetrieveByName]    Script Date: 04/08/2011 13:35:39 ******/
    SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[RefStateRetrieveByName]
    (
     @WorkflowName VARCHAR(100),
     @StateName VARCHAR(100),
     @Debug BIT = 0
    )
AS /************************************************
* CareWebQI
* NAME		: RefStateRetrieveByName
* AUTHOR  	: (generated)
* DATE		: 2/16/2011
* LAST REV	: 2/16/2011
*
* PURPOSE:	Selects a RefState record based on the primary key.
*
* TABLES USED:  RefState
*
* PARAMETERS IN:
* 		StateID			- Primary Key
* 		Debug				- Flag for debug printing
*
* RETURNS:
* 		 0	- Successful
* 		-1	- Generic failure
*
*****************************************************
* REVISION HISTORY:
*
*****************************************************
*/
    BEGIN

        DECLARE @errCode INT ;
        DECLARE @procName VARCHAR(50) ;

        SET @errCode = 0 ;
        SET @procName = 'RefStateRetrieveByName' ;

        IF @Debug = 1 
            BEGIN
                PRINT @procName + ': Selecting specified [RefState] record...' ;
            END

        SELECT  rf.StateID,
                rf.StateName,
                rf.Description
        FROM    RefState rf
                INNER JOIN RefWorkflow rw ON rw.WorkflowID = rf.WorkflowID
        WHERE   rw.WorkflowName = @WorkflowName
                AND rf.StateName = @StateName
                AND rw.Active = 1
                AND rf.Active = 1 ;

        SELECT  @errCode = @errCode + @@ERROR ;

        IF @errCode <> 0 
            RETURN -1 ;
        ELSE 
            RETURN 0 ;

    END



/****** Object:  StoredProcedure [dbo].[RuleRetrieveEndState]    Script Date: 04/08/2011 13:35:47 ******/
    SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[RuleRetrieveEndState]
    (
     @WorkflowName VARCHAR(100),
     @BeginStateName VARCHAR(100),
     @TaskName VARCHAR(100),
     @TaskStatusName VARCHAR(100),
     @Debug BIT = 0
    )
AS /************************************************
* Workflow
* NAME		: RuleRetrieveEndState
* AUTHOR  	: (generated)
* DATE		: 2/11/2011
* LAST REV	: 2/11/2011
*
* PURPOSE:	Selecting RefTask record by BeginStateName and TaskName.
*
* TABLES USED:  [Rule]
*
* PARAMETERS IN:
* 		barrierID			- Primary Key
* 		Debug				- Flag for debug printing
*
* RETURNS:
* 		 0	- Successful
* 		-1	- Generic failure
*
*****************************************************
* REVISION HISTORY:
*
*****************************************************
*/
    BEGIN

        DECLARE @errCode INT ;
        DECLARE @procName VARCHAR(50) ;

        SET @errCode = 0 ;
        SET @procName = 'RuleRetrieveEndState' ;

        IF @Debug = 1 
            BEGIN
                PRINT @procName + ': Selecting RefTask record by StartState...' ;
            END ;

        SELECT  rs2.StateID,
                rs2.StateName,
                rs2.Description
        FROM    [Rule] r
                INNER JOIN RefState rs ON rs.StateID = r.BeginStateID
                INNER JOIN RefState rs2 ON rs2.StateID = r.EndStateID
                INNER JOIN RefTask rt ON rt.TaskID = r.TaskID
                INNER JOIN RefTaskStatus rts ON rts.TaskStatusID = r.TaskStatusID
                INNER JOIN RefWorkflow rw ON rw.WorkflowID = rs.WorkflowID
        WHERE   rw.WorkflowName = @WorkflowName
                AND rs.StateName = @BeginStateName
                AND rt.TaskName = @TaskName
                AND rts.TaskStatusName = @TaskStatusName
                AND r.Active = 1
                AND rw.Active = 1
                AND rs.Active = 1
                AND rt.Active = 1
                AND rts.Active = 1 ;

        SELECT  @errCode = @errCode + @@ERROR ;

        IF @errCode <> 0 
            RETURN -1 ;
        ELSE 
            RETURN 0 ;

    END



/****** Object:  StoredProcedure [dbo].[RuleRetrieveRefTasks]    Script Date: 04/08/2011 13:35:53 ******/
    SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[RuleRetrieveTasks]
    (
     @WorkflowName VARCHAR(100),
     @BeginStateName VARCHAR(100),
     @Debug BIT = 0
    )
AS /************************************************
* Workflow
* NAME		: RuleRetrieveRefTasks
* AUTHOR  	: (generated)
* DATE		: 2/11/2011
* LAST REV	: 2/11/2011
*
* PURPOSE:	Selecting RefTask record by BeginStateName.
*
* TABLES USED:  [Rule]
*
* PARAMETERS IN:
* 		barrierID			- Primary Key
* 		Debug				- Flag for debug printing
*
* RETURNS:
* 		 0	- Successful
* 		-1	- Generic failure
*
*****************************************************
* REVISION HISTORY:
*
*****************************************************
*/
    BEGIN

        DECLARE @errCode INT ;
        DECLARE @procName VARCHAR(50) ;

        SET @errCode = 0 ;
        SET @procName = 'RuleRetrieveRefTasks' ;

        IF @Debug = 1 
            BEGIN
                PRINT @procName + ': Selecting RefTask record by StartState...' ;
            END ;

        SELECT  rt.TaskID,
                rt.TaskName,
                rt.Description
        FROM    [Rule] r
                INNER JOIN RefState rs ON rs.StateID = r.BeginStateID
                INNER JOIN RefTask rt ON rt.TaskID = r.TaskID
                INNER JOIN RefWorkflow rw ON rw.WorkflowID = rs.WorkflowID
        WHERE   rw.WorkflowName = @WorkflowName
                AND rs.StateName = @BeginStateName
                AND rw.Active = 1
                AND rs.Active = 1
                AND rt.Active = 1 ;

        SELECT  @errCode = @errCode + @@ERROR ;

        IF @errCode <> 0 
            RETURN -1 ;
        ELSE 
            RETURN 0 ;

    END
