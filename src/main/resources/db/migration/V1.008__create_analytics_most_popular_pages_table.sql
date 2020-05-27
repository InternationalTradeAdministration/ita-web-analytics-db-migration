CREATE TABLE ${flyway:defaultSchema}.analytics_most_popular_pages
(
    id         bigint PRIMARY KEY,
    created_at datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
)
