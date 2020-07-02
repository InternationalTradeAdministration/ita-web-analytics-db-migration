CREATE TABLE ${flyway:defaultSchema}.content_pages
(
    id         bigint PRIMARY KEY,
    title      nvarchar(4000),
    url        nvarchar(4000) NOT NULL,
    created_at datetime       NOT NULL DEFAULT CURRENT_TIMESTAMP
)
