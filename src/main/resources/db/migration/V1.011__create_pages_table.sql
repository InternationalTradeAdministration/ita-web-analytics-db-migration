CREATE TABLE ${flyway:defaultSchema}.pages
(
    id         bigint PRIMARY KEY,
    title      nvarchar(4000),
    url        nvarchar(4000) NOT NULL,
    page_level int,
    page_views bigint,
    created_at datetime       NOT NULL DEFAULT CURRENT_TIMESTAMP
)
