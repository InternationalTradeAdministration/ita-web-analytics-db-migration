CREATE TABLE ${flyway:defaultSchema}.analytics_pages
(
    id                           bigint PRIMARY KEY,
    title                        nvarchar(4000),
    url                          nvarchar(4000) NOT NULL,
    average_page_views_per_visit decimal(9, 2),
    bounce_rate                  decimal(9, 2),
    page_views                   bigint,
    visits                       bigint,
    created_at                   datetime       NOT NULL DEFAULT CURRENT_TIMESTAMP
)
