CREATE TABLE ${flyway:defaultSchema}.analytics_browsers_metrics
(
    analytics_group_id  bigint         NOT NULL,
    analytics_filter_id bigint         NOT NULL,
    timestamp           char(26)       NOT NULL,
    browser_name        nvarchar(4000) NOT NULL,
    visits              int,
    created_at          datetime       NOT NULL DEFAULT CURRENT_TIMESTAMP
)

CREATE NONCLUSTERED INDEX index_analytics_browsers_metrics_on_group_id ON ${flyway:defaultSchema}.analytics_browsers_metrics (analytics_group_id)

CREATE NONCLUSTERED INDEX index_analytics_browsers_metrics_on_filter_id ON ${flyway:defaultSchema}.analytics_browsers_metrics (analytics_filter_id)

CREATE NONCLUSTERED INDEX index_analytics_browsers_metrics_on_timestamp ON ${flyway:defaultSchema}.analytics_browsers_metrics (timestamp)