INSERT  [iCCG].[Survey]
        ([SurveyName]
        ,[Ordinal]
        ,[Active]
        ,[CreatedDate]
        ,[CreatedBy]
        ,[ModifiedDate]
        ,[ModifiedBy])
VALUES  (N'Smoking'
        ,1
        ,1
        ,CAST(0x00009E9300000000 AS DATETIME)
        ,NULL
        ,NULL
        ,NULL)

INSERT  [iCCG].[Program]
        ([Description]
        ,[Ordinal]
        ,[Active]
        ,[CreatedDate]
        ,[CreatedBy]
        ,[ModifiedDate]
        ,[ModifiedBy])
VALUES  (N'Healthy Heart'
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL)

INSERT  [iCCG].[Case]
        ([OriginalCaseNumber]
        ,[PatientID]
        ,[CaseOwnerID]
        ,[ProviderID]
        ,[TypeID]
        ,[IdentifiedDate]
        ,[OpenDate]
        ,[CloseDate]
        ,[ClosureReasonID]
        ,[StatusID]
        ,[Source]
        ,[Active]
        ,[CreatedDate]
        ,[CreatedBy]
        ,[ModifiedDate]
        ,[ModifiedBy])
VALUES  (N'0001'
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL)

