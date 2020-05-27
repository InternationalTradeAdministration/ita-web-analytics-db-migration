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
CREATE OR ALTER VIEW ' + QUOTENAME(@access_schema_name) + N'.[pages_with_broken_links]
AS
SELECT id AS [Page ID],
       broken_links AS [Broken Links]
FROM ${flyway:defaultSchema}.pages_with_broken_links
'
        IF @access_schema_name <> '${masterAccessSchema}'
            SET @sql_string += N'
WHERE id IN (
    SELECT [Page ID]
    FROM ' + QUOTENAME(@access_schema_name) + N'.[pages])';

        EXECUTE sp_executesql @sql_string;

        FETCH NEXT FROM access_schema_cursor INTO @access_schema_name;
    END;
CLOSE access_schema_cursor;
DEALLOCATE access_schema_cursor;
GO