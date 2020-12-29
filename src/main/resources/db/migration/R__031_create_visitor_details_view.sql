CREATE OR ALTER VIEW [web_analytics_wiv].[visitor_details]
AS
SELECT id AS [Visitor ID],
       json AS [JSON]
FROM ${flyway:defaultSchema}.visitor_details
