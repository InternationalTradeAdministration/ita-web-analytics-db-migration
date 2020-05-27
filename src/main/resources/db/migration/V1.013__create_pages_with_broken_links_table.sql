CREATE TABLE ${flyway:defaultSchema}.pages_with_broken_links
(
    id           bigint PRIMARY KEY,
    broken_links int,
    created_at   datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
)
