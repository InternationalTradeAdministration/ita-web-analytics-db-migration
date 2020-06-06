CREATE TABLE ${flyway:defaultSchema}.access_schemas_content_groups
(
    access_schema_id bigint NOT NULL,
    content_group_id bigint NOT NULL
)

CREATE UNIQUE NONCLUSTERED INDEX index_access_schemas_content_groups ON ${flyway:defaultSchema}.access_schemas_content_groups (access_schema_id, content_group_id)

CREATE NONCLUSTERED INDEX index_access_schemas_content_groups_on_access_schema_id ON ${flyway:defaultSchema}.access_schemas_content_groups (access_schema_id)

CREATE NONCLUSTERED INDEX index_access_schemas_content_groups_on_content_group_id ON ${flyway:defaultSchema}.access_schemas_content_groups (content_group_id)