CREATE OR ALTER VIEW [web_analytics_wiv].[triggers_visitor_sessions]
AS
SELECT visitor_session_id AS [Visitor Session ID],
       trigger_id AS [Trigger ID],
       count AS [Trigger Count]
FROM ${flyway:defaultSchema}.triggers_visitor_sessions
