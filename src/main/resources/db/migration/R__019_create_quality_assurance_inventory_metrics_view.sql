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
CREATE OR ALTER VIEW ' + QUOTENAME(@access_schema_name) + N'.[quality_assurance_inventory_metrics]
AS
SELECT content_group_id AS [Content Group ID],
       timestamp AS [Timestamp],
       data_category AS [Data Category],
       count AS [Count]
FROM ${flyway:defaultSchema}.quality_assurance_inventory_metrics m
'
        IF @access_schema_name <> '${masterAccessSchema}'
            SET @sql_string += N'
WHERE content_group_id IN (
    SELECT [Content Group ID]
    FROM ' + QUOTENAME(@access_schema_name) + N'.[content_groups])';

        EXECUTE sp_executesql @sql_string;

        FETCH NEXT FROM access_schema_cursor INTO @access_schema_name;
    END;
CLOSE access_schema_cursor;
DEALLOCATE access_schema_cursor;
GO