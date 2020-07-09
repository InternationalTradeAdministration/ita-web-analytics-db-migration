CREATE TABLE ${flyway:defaultSchema}.access_schemas
(
    id         bigint IDENTITY,
    name       nvarchar(128) NOT NULL,
    created_at datetime      NOT NULL DEFAULT CURRENT_TIMESTAMP
)
