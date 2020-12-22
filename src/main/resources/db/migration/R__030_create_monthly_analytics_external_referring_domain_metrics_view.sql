DECLARE @access_schema_name AS nvarchar(4000)
DECLARE @sql_string AS nvarchar(4000)

DECLARE access_schema_cursor CURSOR FOR
    SELECT name
    FROM ${flyway:defaultSchema}.access_schemas;
OPEN access_schema_cursor;
FETCH NEXT FROM access_schema_cursor INTO @access_schema_name;
WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @sql_string = N'
CREATE OR ALTER VIEW ' + QUOTENAME(@access_schema_name) + N'.[monthly_analytics_external_referring_domain_metrics]
AS
SELECT analytics_external_domain_id AS [Analytics External Referring Domain ID],
       analytics_group_id AS [Analytics Group ID],
       date AS [Monthly Date],
       external_referring_domain AS [Monthly External Referring Domain],
       bounce_rate AS [Monthly External Referring Domain Bounce Rate],
       visits AS [Monthly External Referring Domain Visits]
FROM ${flyway:defaultSchema}.monthly_analytics_external_referring_domain_metrics
'
        IF @access_schema_name <> '${masterAccessSchema}'
            SET @sql_string += N'
WHERE analytics_group_id IN (
    SELECT [Analytics Group ID]
    FROM ' + QUOTENAME(@access_schema_name) + N'.[analytics_groups])';

        EXECUTE sp_executesql @sql_string;

        FETCH NEXT FROM access_schema_cursor INTO @access_schema_name;
    END;
CLOSE access_schema_cursor;
DEALLOCATE access_schema_cursor;
GO
