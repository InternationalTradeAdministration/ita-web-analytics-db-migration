CREATE TABLE ${flyway:defaultSchema}.analytics_event_tracking_metrics
(
    analytics_page_id bigint         NOT NULL,
    date              char(8)        NOT NULL,
    category          nvarchar(4000) NOT NULL,
    action            nvarchar(4000) NOT NULL,
    label             nvarchar(4000),
    events            int,
    created_at        datetime       NOT NULL DEFAULT CURRENT_TIMESTAMP
)

CREATE NONCLUSTERED INDEX index_analytics_event_tracking_metrics_on_analytics_page_id ON ${flyway:defaultSchema}.analytics_event_tracking_metrics (analytics_page_id)

CREATE NONCLUSTERED INDEX index_analytics_event_tracking_metrics_on_date ON ${flyway:defaultSchema}.analytics_event_tracking_metrics (date)