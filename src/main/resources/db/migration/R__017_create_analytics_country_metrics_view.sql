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
CREATE OR ALTER VIEW ' + QUOTENAME(@access_schema_name) + N'.[analytics_country_metrics]
AS
SELECT analytics_group_id AS [Analytics Group ID],
       date AS [Date],
       country_id AS [Country ID],
       m.country_code AS [Country Code],
       CASE WHEN n.country_name IS NOT NULL
           THEN n.country_name
           ELSE m.country_name
       END AS [Country],
       is_region AS [Is Region],
       is_unknown AS [Is Unknown],
       bounce_rate AS [Bounce Rate],
       visits AS [Visits]
FROM ${flyway:defaultSchema}.analytics_country_metrics m
LEFT OUTER JOIN ${flyway:defaultSchema}.country_names n
ON m.country_code = n.country_code
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