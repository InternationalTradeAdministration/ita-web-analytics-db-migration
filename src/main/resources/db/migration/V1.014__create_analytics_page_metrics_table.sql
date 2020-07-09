CREATE TABLE ${flyway:defaultSchema}.analytics_page_metrics
(
    analytics_page_id            bigint   NOT NULL,
    date                         char(8)  NOT NULL,
    average_page_views_per_visit decimal(9, 2),
    bounce_rate                  decimal(9, 2),
    page_views                   int,
    visits                       int,
    created_at                   datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
)

CREATE UNIQUE NONCLUSTERED INDEX index_analytics_page_metrics ON ${flyway:defaultSchema}.analytics_page_metrics (analytics_page_id, date)

CREATE NONCLUSTERED INDEX index_analytics_page_metrics_on_analytics_page_id ON ${flyway:defaultSchema}.analytics_page_metrics (analytics_page_id)

CREATE NONCLUSTERED INDEX index_analytics_page_metrics_on_date ON ${flyway:defaultSchema}.analytics_page_metrics (date)