CREATE TABLE ${flyway:defaultSchema}.triggers
(
    id         bigint PRIMARY KEY,
    name       nvarchar(500) NOT NULL,
    created_at datetime      NOT NULL DEFAULT CURRENT_TIMESTAMP
);
