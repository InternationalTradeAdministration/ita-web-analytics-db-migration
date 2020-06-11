CREATE TABLE ${flyway:defaultSchema}.analytics_historical_metrics
(
    analytics_group_id  bigint   NOT NULL,
    analytics_filter_id bigint   NOT NULL,
    timestamp           char(26) NOT NULL,
    bounce_rate         decimal(9, 2),
    page_views          bigint,
    visits              bigint,
    new_visitors        bigint,
    returning_visitors  bigint,
    unique_visitors     bigint,
    created_at          datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
)

CREATE NONCLUSTERED INDEX index_analytics_historical_metrics_on_group_id ON ${flyway:defaultSchema}.analytics_historical_metrics (analytics_group_id)

CREATE NONCLUSTERED INDEX index_analytics_historical_metrics_on_filter_id ON ${flyway:defaultSchema}.analytics_historical_metrics (analytics_filter_id)

CREATE NONCLUSTERED INDEX index_analytics_historical_metrics_on_timestamp ON ${flyway:defaultSchema}.analytics_historical_metrics (timestamp)