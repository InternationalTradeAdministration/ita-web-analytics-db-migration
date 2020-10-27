TRUNCATE TABLE web_analytics.access_schemas_analytics_groups;

DECLARE @access_schema_id bigint;

-- E&C
SELECT @access_schema_id = id
FROM web_analytics.access_schemas
WHERE name = 'web_analytics_ec';

INSERT INTO web_analytics.access_schemas_analytics_groups
SELECT @access_schema_id, id
FROM web_analytics.analytics_groups
WHERE name IN ('E&C Analytics Group');

-- EXAD
SELECT @access_schema_id = id
FROM web_analytics.access_schemas
WHERE name = 'web_analytics_exad';

INSERT INTO web_analytics.access_schemas_analytics_groups
SELECT @access_schema_id, id
FROM web_analytics.analytics_groups
WHERE name IN ('Press Release Pages');

-- GM
SELECT @access_schema_id = id
FROM web_analytics.access_schemas
WHERE name = 'web_analytics_gm';

INSERT INTO web_analytics.access_schemas_analytics_groups
SELECT @access_schema_id, id
FROM web_analytics.analytics_groups
WHERE name like '%CCG%';

INSERT INTO web_analytics.access_schemas_analytics_groups
SELECT @access_schema_id, id
FROM web_analytics.analytics_groups
WHERE name IN ('EIL - Analytics',
               'Eventtia',
               'Export Solutions Group (C&A)',
               'Knowledge Product',
               'Office',
               'Prosper Africa',
               'TEPP');

-- I&A
SELECT @access_schema_id = id
FROM web_analytics.access_schemas
WHERE name = 'web_analytics_ia';

INSERT INTO web_analytics.access_schemas_analytics_groups
SELECT @access_schema_id, id
FROM web_analytics.analytics_groups
WHERE name IN ('Industry Pages',
               'SC & P/B Services');

-- SIMA
SELECT @access_schema_id = id
FROM web_analytics.access_schemas
WHERE name = 'web_analytics_sima';

INSERT INTO web_analytics.access_schemas_analytics_groups
SELECT @access_schema_id, id
FROM web_analytics.analytics_groups
WHERE name IN ('SIMA Page Group');
