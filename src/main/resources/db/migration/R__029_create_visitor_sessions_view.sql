CREATE OR ALTER VIEW [web_analytics_wiv].[visitor_sessions]
AS
SELECT id AS [Visitor Session ID],
       visitor_id AS [Visitor ID],
       session_start AS [Visitor Session Start At],
       page_views AS [Visitor Session Pageviews],
       duration AS [Visitor Session Duration],
       source AS [Visitor Session Source],
       first_visit AS [Is First Visit]
FROM ${flyway:defaultSchema}.visitor_sessions
