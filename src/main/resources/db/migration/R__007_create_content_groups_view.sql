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
CREATE OR ALTER VIEW ' + QUOTENAME(@access_schema_name) + N'.[content_groups]
AS'
        IF @access_schema_name = '${masterAccessSchema}'
            SET @sql_string += N'
SELECT 1 AS [Content Group ID],
' + QUOTENAME('Not Selected', '''') + N' AS [Content Group]
UNION'
        SET @sql_string += N'
SELECT id AS [Content Group ID],
       name AS [Content Group]
FROM ${flyway:defaultSchema}.content_groups
'
        IF @access_schema_name <> '${masterAccessSchema}'
            SET @sql_string += N'
WHERE id IN (
    SELECT g.id
    FROM ${flyway:defaultSchema}.content_groups g
    INNER JOIN ${flyway:defaultSchema}.access_schemas_content_groups b
        ON g.id = b.content_group_id
    INNER JOIN ${flyway:defaultSchema}.access_schemas s
        ON s.id = b.access_schema_id
    WHERE s.name = ' + QUOTENAME(@access_schema_name, '''') + N')';

        EXECUTE sp_executesql @sql_string;

        FETCH NEXT FROM access_schema_cursor INTO @access_schema_name;
    END;
CLOSE access_schema_cursor;
DEALLOCATE access_schema_cursor;
GO