CREATE TABLE ${flyway:defaultSchema}.analytics_page_metrics
(
    id                           bigint   NOT NULL,
    filter_id                    bigint   NOT NULL,
    collected_on                 char(8)  NOT NULL,
    average_page_views_per_visit decimal(9, 2),
    bounce_rate                  decimal(9, 2),
    page_views                   bigint,
    visits                       bigint,
    created_at                   datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
)

CREATE NONCLUSTERED INDEX index_analytics_page_metrics_on_id ON ${flyway:defaultSchema}.analytics_page_metrics (id)

CREATE NONCLUSTERED INDEX index_analytics_page_metrics_on_filter_id ON ${flyway:defaultSchema}.analytics_page_metrics (filter_id)

CREATE NONCLUSTERED INDEX index_analytics_page_metrics_on_collected_on ON ${flyway:defaultSchema}.analytics_page_metrics (collected_on)