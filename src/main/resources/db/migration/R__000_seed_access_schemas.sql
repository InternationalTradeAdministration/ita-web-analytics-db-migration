TRUNCATE TABLE ${flyway:defaultSchema}.access_schemas

INSERT INTO ${flyway:defaultSchema}.access_schemas (name)
VALUES ('${masterAccessSchema}')
INSERT INTO ${flyway:defaultSchema}.access_schemas (name)
VALUES ('web_analytics_ec')
INSERT INTO ${flyway:defaultSchema}.access_schemas (name)
VALUES ('web_analytics_exad')
INSERT INTO ${flyway:defaultSchema}.access_schemas (name)
VALUES ('web_analytics_gm')
INSERT INTO ${flyway:defaultSchema}.access_schemas (name)
VALUES ('web_analytics_ia')
INSERT INTO ${flyway:defaultSchema}.access_schemas (name)
VALUES ('web_analytics_sima')
