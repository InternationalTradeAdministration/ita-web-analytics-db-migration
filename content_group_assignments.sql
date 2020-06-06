TRUNCATE TABLE web_analytics.access_schemas_content_groups;

DECLARE @access_schema_id bigint;

-- E&C
SELECT @access_schema_id = id
FROM web_analytics.access_schemas
WHERE name = 'web_analytics_ec';

INSERT INTO web_analytics.access_schemas_content_groups
SELECT @access_schema_id, id
FROM web_analytics.content_groups
WHERE name IN ('E&C Content Group');

-- EXAD
SELECT @access_schema_id = id
FROM web_analytics.access_schemas
WHERE name = 'web_analytics_exad';

INSERT INTO web_analytics.access_schemas_content_groups
SELECT @access_schema_id, id
FROM web_analytics.content_groups
WHERE name IN ('Exad - OUS Content Group');

-- GM
SELECT @access_schema_id = id
FROM web_analytics.access_schemas
WHERE name = 'web_analytics_gm';

INSERT INTO web_analytics.access_schemas_content_groups
SELECT @access_schema_id, id
FROM web_analytics.content_groups
WHERE name IN ('Content - All Industry Pages by Publisher',
               'Export Solutions Group (C&A)',
               'GM-CS Content Group',
               'Knowledge Product',
               'Office');

-- I&A
SELECT @access_schema_id = id
FROM web_analytics.access_schemas
WHERE name = 'web_analytics_ia';

INSERT INTO web_analytics.access_schemas_content_groups
SELECT @access_schema_id, id
FROM web_analytics.content_groups
WHERE name IN ('I&A Content Group');