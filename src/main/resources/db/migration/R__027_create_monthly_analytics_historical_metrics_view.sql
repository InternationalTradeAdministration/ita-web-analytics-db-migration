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
CREATE OR ALTER VIEW ' + QUOTENAME(@access_schema_name) + N'.[monthly_analytics_historical_metrics]
AS
SELECT analytics_group_id AS [Analytics Group ID],
       timestamp AS [Monthly Timestamp],
       bounce_rate AS [Monthly Bounce Rate],
       page_views AS [Monthly Pageviews],
       visits AS [Monthly Visits],
       new_visitors AS [Monthly New Visitors],
       returning_visitors AS [Monthly Returning Visitors],
       unique_visitors AS [Monthly Unique Visitors]
FROM ${flyway:defaultSchema}.monthly_analytics_historical_metrics
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
