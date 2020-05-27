CREATE TABLE ${flyway:defaultSchema}.analytics_groups
(
    id         bigint PRIMARY KEY,
    name       nvarchar(4000) NOT NULL,
    created_at datetime       NOT NULL DEFAULT CURRENT_TIMESTAMP
)
