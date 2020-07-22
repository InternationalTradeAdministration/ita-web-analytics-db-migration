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
CREATE OR ALTER VIEW ' + QUOTENAME(@access_schema_name) + N'.[analytics_event_tracking_metrics]
AS
SELECT analytics_page_id AS [Analytics Page ID],
       date AS [Date],
       category AS [Category],
       action AS [Action],
       label AS [Label],
       Events AS [Events]
FROM ${flyway:defaultSchema}.analytics_event_tracking_metrics
'
        IF @access_schema_name <> '${masterAccessSchema}'
            SET @sql_string += N'
WHERE analytics_page_id IN (
    SELECT [Analytics Page ID]
    FROM ' + QUOTENAME(@access_schema_name) + N'.[analytics_pages])';

        EXECUTE sp_executesql @sql_string;

        FETCH NEXT FROM access_schema_cursor INTO @access_schema_name;
    END;
CLOSE access_schema_cursor;
DEALLOCATE access_schema_cursor;
GO