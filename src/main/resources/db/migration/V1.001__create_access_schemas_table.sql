CREATE TABLE ${flyway:defaultSchema}.access_schemas
(
    id         bigint IDENTITY,
    name       nvarchar(128) NOT NULL,
    created_at datetime      NOT NULL DEFAULT CURRENT_TIMESTAMP
)

INSERT INTO ${flyway:defaultSchema}.access_schemas (name)
VALUES ('${masterAccessSchema}')
INSERT INTO ${flyway:defaultSchema}.access_schemas (name)
VALUES ('web_analytics_enforcement')
INSERT INTO ${flyway:defaultSchema}.access_schemas (name)
VALUES ('web_analytics_industry')