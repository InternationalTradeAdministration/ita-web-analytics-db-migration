CREATE TABLE ${flyway:defaultSchema}.visitor_details
(
    id         bigint PRIMARY KEY,
    json       nvarchar(max),
    created_at datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
)
