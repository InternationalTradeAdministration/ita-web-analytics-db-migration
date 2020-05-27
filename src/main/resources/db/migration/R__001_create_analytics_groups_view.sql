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
CREATE OR ALTER VIEW ' + QUOTENAME(@access_schema_name) + N'.[analytics_groups]
AS
SELECT id AS [Analytics Group ID],
       name AS [Analytics Group]
FROM ${flyway:defaultSchema}.analytics_groups
'

--         IF @access_schema_name <> '${masterAccessSchema}'
--             SET @sql_string += N'
-- WHERE id IN (
--     SELECT g.id
--     FROM ${flyway:defaultSchema}.analytics_groups g
--     INNER JOIN ${flyway:defaultSchema}.access_schemas_analytics_groups b
--         ON g.id = b.analytics_group_id
--     INNER JOIN ${flyway:defaultSchema}.access_schemas s
--         ON s.id = b.access_schema_id
--     WHERE s.name = ' + QUOTENAME(@access_schema_name, '''') + N')';

        EXECUTE sp_executesql @sql_string;

        FETCH NEXT FROM access_schema_cursor INTO @access_schema_name;
    END;
CLOSE access_schema_cursor;
DEALLOCATE access_schema_cursor;
GO