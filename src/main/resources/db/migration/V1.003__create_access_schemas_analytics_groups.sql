CREATE TABLE ${flyway:defaultSchema}.access_schemas_analytics_groups
(
    access_schema_id   bigint NOT NULL,
    analytics_group_id bigint NOT NULL
)

CREATE UNIQUE NONCLUSTERED INDEX index_access_schemas_analytics_groups ON ${flyway:defaultSchema}.access_schemas_analytics_groups (analytics_group_id, access_schema_id)

CREATE NONCLUSTERED INDEX index_access_schemas_analytics_groups_on_analytics_group_id ON ${flyway:defaultSchema}.access_schemas_analytics_groups (analytics_group_id)

CREATE NONCLUSTERED INDEX index_access_schemas_analytics_groups_on_access_schema_id ON ${flyway:defaultSchema}.access_schemas_analytics_groups (access_schema_id)