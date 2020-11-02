CREATE OR ALTER VIEW [web_analytics_wiv].[visitors]
AS
SELECT id AS [Visitor ID],
       name AS [Visitor Name],
       country_short_name AS [Country Short Name],
       region AS [Region],
       first_visited AS [First Visited],
       company AS [Is Company],
       ignored AS [Is Ignored]
FROM ${flyway:defaultSchema}.visitors
