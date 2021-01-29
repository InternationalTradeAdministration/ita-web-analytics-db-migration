CREATE OR ALTER VIEW [web_analytics_wiv].[triggers]
AS
SELECT id AS [Trigger ID],
       name AS [Trigger]
FROM ${flyway:defaultSchema}.triggers
