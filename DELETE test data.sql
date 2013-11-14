---- DON'T CHANGE THE ORDER OF THESE!!!!
--

SET NOCOUNT OFF

IF EXISTS(SELECT * FROM iCCG.SectionBarrier) BEGIN DELETE FROM iCCG.SectionBarrier; DBCC CHECKIDENT('iCCG.SectionBarrier', RESEED, 0); END;
IF EXISTS(SELECT * FROM iCCG.QASBarrier) BEGIN DELETE FROM iCCG.QASBarrier; DBCC CHECKIDENT('iCCG.QASBarrier', RESEED, 0); END;
IF EXISTS(SELECT * FROM iCCG.CaseIntervention) BEGIN DELETE FROM iCCG.CaseIntervention; DBCC CHECKIDENT('iCCG.CaseIntervention', RESEED, 0); END;
IF EXISTS(SELECT * FROM iCCG.CaseBarrier) BEGIN DELETE FROM iCCG.CaseBarrier; DBCC CHECKIDENT('iCCG.CaseBarrier', RESEED, 0); END;
IF EXISTS(SELECT * FROM iCCG.GoalIntervention) BEGIN DELETE FROM iCCG.GoalIntervention; DBCC CHECKIDENT('iCCG.GoalIntervention', RESEED, 0); END;
IF EXISTS(SELECT * FROM iCCG.GoalProblem) BEGIN DELETE FROM iCCG.GoalProblem; DBCC CHECKIDENT('iCCG.GoalProblem', RESEED, 0); END;
IF EXISTS(SELECT * FROM iCCG.CaseGoalBarrier) BEGIN DELETE FROM iCCG.CaseGoalBarrier; DBCC CHECKIDENT('iCCG.CaseGoalBarrier', RESEED, 0); END;
IF EXISTS(SELECT * FROM iCCG.CaseGoalNoteLink) BEGIN DELETE FROM iCCG.CaseGoalNoteLink; DBCC CHECKIDENT('iCCG.CaseGoalNoteLink', RESEED, 0); END;
IF EXISTS(SELECT * FROM iCCG.CaseGoalNote) BEGIN DELETE FROM iCCG.CaseGoalNote; DBCC CHECKIDENT('iCCG.CaseGoalNote', RESEED, 0); END;
IF EXISTS(SELECT * FROM iCCG.CaseGoal) BEGIN DELETE FROM iCCG.CaseGoal; DBCC CHECKIDENT('iCCG.CaseGoal', RESEED, 0); END;
IF EXISTS(SELECT * FROM iCCG.CaseProblemAD) BEGIN DELETE FROM iCCG.CaseProblemAD; DBCC CHECKIDENT('iCCG.CaseProblemAD', RESEED, 0); END;
IF EXISTS(SELECT * FROM iCCG.CaseProblemNoteLink) BEGIN DELETE FROM iCCG.CaseProblemNoteLink; DBCC CHECKIDENT('iCCG.CaseProblemNoteLink', RESEED, 0); END;
IF EXISTS(SELECT * FROM iCCG.CaseProblemNote) BEGIN DELETE FROM iCCG.CaseProblemNote; DBCC CHECKIDENT('iCCG.CaseProblemNote', RESEED, 0); END;
IF EXISTS(SELECT * FROM iCCG.CaseProblem) BEGIN DELETE FROM iCCG.CaseProblem; DBCC CHECKIDENT('iCCG.CaseProblem', RESEED, 0); END;
IF EXISTS(SELECT * FROM iCCG.AssessmentProblem) BEGIN DELETE FROM iCCG.AssessmentProblem; DBCC CHECKIDENT('iCCG.AssessmentProblem', RESEED, 0); END;
IF EXISTS(SELECT * FROM iCCG.QASProblem) BEGIN DELETE FROM iCCG.QASProblem; DBCC CHECKIDENT('iCCG.QASProblem', RESEED, 0); END;
IF EXISTS(SELECT * FROM iCCG.QASSectionQAG) BEGIN DELETE FROM iCCG.QASSectionQAG; DBCC CHECKIDENT('iCCG.QASSectionQAG', RESEED, 0); END;
IF EXISTS(SELECT * FROM iCCG.QuestionAnswerSetMember) BEGIN DELETE FROM iCCG.QuestionAnswerSetMember; DBCC CHECKIDENT('iCCG.QuestionAnswerSetMember', RESEED, 0); END;
IF EXISTS(SELECT * FROM iCCG.QuestionAnswerSet) BEGIN DELETE FROM iCCG.QuestionAnswerSet; DBCC CHECKIDENT('iCCG.QuestionAnswerSet', RESEED, 0); END;
IF EXISTS(SELECT * FROM iCCG.AssessmentDocumentation) BEGIN DELETE FROM iCCG.AssessmentDocumentation; DBCC CHECKIDENT('iCCG.AssessmentDocumentation', RESEED, 0); END;
IF EXISTS(SELECT * FROM iCCG.SectionQuestionAnswerGroupMember) BEGIN DELETE FROM iCCG.SectionQuestionAnswerGroupMember; DBCC CHECKIDENT('iCCG.SectionQuestionAnswerGroupMember', RESEED, 0); END;
IF EXISTS(SELECT * FROM iCCG.SectionQuestionAnswerGroup) BEGIN DELETE FROM iCCG.SectionQuestionAnswerGroup; DBCC CHECKIDENT('iCCG.SectionQuestionAnswerGroup', RESEED, 0); END;
IF EXISTS(SELECT * FROM iCCG.ClinicalHistoryDocumentation) BEGIN DELETE FROM iCCG.ClinicalHistoryDocumentation; DBCC CHECKIDENT('iCCG.ClinicalHistoryDocumentation', RESEED, 0); END;
IF EXISTS(SELECT * FROM iCCG.ClinicalHistory) BEGIN DELETE FROM iCCG.ClinicalHistory; DBCC CHECKIDENT('iCCG.ClinicalHistory', RESEED, 0); END;
IF EXISTS(SELECT * FROM iCCG.Assessment) BEGIN DELETE FROM iCCG.Assessment; DBCC CHECKIDENT('iCCG.Assessment', RESEED, 0); END;
IF EXISTS(SELECT * FROM iCCG.Intervention) BEGIN DELETE FROM iCCG.Intervention; DBCC CHECKIDENT('iCCG.Intervention', RESEED, 0); END;
IF EXISTS(SELECT * FROM iCCG.Note) BEGIN DELETE FROM iCCG.Note; DBCC CHECKIDENT('iCCG.Note', RESEED, 0); END;
IF EXISTS(SELECT * FROM iCCG.PatientMedicine) BEGIN DELETE FROM iCCG.PatientMedicine; DBCC CHECKIDENT('iCCG.PatientMedicine', RESEED, 0); END;
IF EXISTS(SELECT * FROM iCCG.Problem) BEGIN DELETE FROM iCCG.Problem; DBCC CHECKIDENT('iCCG.Problem', RESEED, 0); END;
IF EXISTS(SELECT * FROM iCCG.Barrier) BEGIN DELETE FROM iCCG.Barrier; DBCC CHECKIDENT('iCCG.Barrier', RESEED, 0); END;
IF EXISTS(SELECT * FROM iCCG.Goal) BEGIN DELETE FROM iCCG.Goal; DBCC CHECKIDENT('iCCG.Goal', RESEED, 0); END;
IF EXISTS(SELECT * FROM iCCG.QuestionAnswer) BEGIN DELETE FROM iCCG.QuestionAnswer; DBCC CHECKIDENT('iCCG.QuestionAnswer', RESEED, 0); END;
IF EXISTS(SELECT * FROM iCCG.QuestionAnswerSet) BEGIN DELETE FROM iCCG.QuestionAnswerSet; DBCC CHECKIDENT('iCCG.QuestionAnswerSet', RESEED, 0); END;
IF EXISTS(SELECT * FROM iCCG.QuestionAnswerSetMember) BEGIN DELETE FROM iCCG.QuestionAnswerSetMember; DBCC CHECKIDENT('iCCG.QuestionAnswerSetMember', RESEED, 0); END;
IF EXISTS(SELECT * FROM iCCG.Answer) BEGIN DELETE FROM iCCG.Answer; DBCC CHECKIDENT('iCCG.Answer', RESEED, 0); END;
IF EXISTS(SELECT * FROM iCCG.Question) BEGIN DELETE FROM iCCG.Question; DBCC CHECKIDENT('iCCG.Question', RESEED, 0); END;
IF EXISTS(SELECT * FROM iCCG.Survey) BEGIN DELETE FROM iCCG.Survey; DBCC CHECKIDENT('iCCG.Survey', RESEED, 0); END;
IF EXISTS(SELECT * FROM iCCG.SectionHierarchy) BEGIN DELETE FROM iCCG.SectionHierarchy; DBCC CHECKIDENT('iCCG.SectionHierarchy', RESEED, 0); END;
IF EXISTS(SELECT * FROM dbo.Outline) BEGIN DELETE FROM dbo.Outline; DBCC CHECKIDENT('dbo.Outline', RESEED, 0); END;
IF EXISTS(SELECT * FROM dbo.OutlineDocumentedIndication) BEGIN DELETE FROM dbo.OutlineDocumentedIndication; DBCC CHECKIDENT('dbo.OutlineDocumentedIndication', RESEED, 0); END;
IF EXISTS(SELECT * FROM dbo.SectionIndication) BEGIN DELETE FROM dbo.SectionIndication; DBCC CHECKIDENT('dbo.SectionIndication', RESEED, 0); END;
IF EXISTS(SELECT * FROM dbo.GuidelineCache) BEGIN DELETE FROM dbo.GuidelineCache; DBCC CHECKIDENT('dbo.GuidelineCache', RESEED, 0); END;
IF EXISTS(SELECT * FROM dbo.GuidelineSection) BEGIN DELETE FROM dbo.GuidelineSection; DBCC CHECKIDENT('dbo.GuidelineSection', RESEED, 0); END;
IF EXISTS(SELECT * FROM iCCG.CaseProgramGuideline) BEGIN DELETE FROM iCCG.CaseProgramGuideline; DBCC CHECKIDENT('iCCG.CaseProgramGuideline', RESEED, 0); END;
IF EXISTS(SELECT * FROM iCCG.CaseProgram) BEGIN DELETE FROM iCCG.CaseProgram; DBCC CHECKIDENT('iCCG.CaseProgram', RESEED, 0); END;
IF EXISTS(SELECT * FROM iCCG.CaseContact) BEGIN DELETE FROM iCCG.CaseContact; DBCC CHECKIDENT('iCCG.CaseContact', RESEED, 0); END;
IF EXISTS(SELECT * FROM iCCG.TaskCase) BEGIN DELETE FROM iCCG.TaskCase; DBCC CHECKIDENT('iCCG.TaskCase', RESEED, 0); END;
IF EXISTS(SELECT * FROM iCCG.[Case]) BEGIN DELETE FROM iCCG.[Case]; DBCC CHECKIDENT('iCCG.[Case]', RESEED, 0); END;
IF EXISTS(SELECT * FROM dbo.TaskEpisode) BEGIN DELETE FROM dbo.TaskEpisode; DBCC CHECKIDENT('dbo.TaskEpisode', RESEED, 0); END;
IF EXISTS(SELECT * FROM dbo.TaskPatient) BEGIN DELETE FROM dbo.TaskPatient; DBCC CHECKIDENT('dbo.TaskPatient', RESEED, 0); END;
IF EXISTS(SELECT * FROM Platform.TaskNote) BEGIN DELETE FROM Platform.TaskNote; DBCC CHECKIDENT('Platform.TaskNote', RESEED, 0); END;
IF EXISTS(SELECT * FROM Platform.Task) BEGIN DELETE FROM Platform.Task; DBCC CHECKIDENT('Platform.Task', RESEED, 0); END;
IF EXISTS(SELECT * FROM iCCG.[CaseContact]) BEGIN DELETE FROM iCCG.[CaseContact]; DBCC CHECKIDENT('iCCG.[CaseContact]', RESEED, 0); END;
IF EXISTS(SELECT * FROM Platform.Contact) BEGIN DELETE FROM Platform.Contact; DBCC CHECKIDENT('Platform.Contact', RESEED, 0); END;
