CREATE TABLE ${flyway:defaultSchema}.analytics_traffic_sources_overview_metrics
(
    analytics_group_id  bigint        NOT NULL,
    analytics_filter_id bigint        NOT NULL,
    collected_on        char(8)       NOT NULL,
    type                nvarchar(128) NOT NULL,
    bounce_rate         decimal(9, 2),
    visits              bigint,
    created_at          datetime      NOT NULL DEFAULT CURRENT_TIMESTAMP
)

CREATE NONCLUSTERED INDEX index_analytics_traffic_sources_summary_on_analytics_group_id ON ${flyway:defaultSchema}.analytics_traffic_sources_overview_metrics (analytics_group_id)

CREATE NONCLUSTERED INDEX index_analytics_traffic_sources_summary_on_analytics_filter_id ON ${flyway:defaultSchema}.analytics_traffic_sources_overview_metrics (analytics_filter_id)

CREATE NONCLUSTERED INDEX index_analytics_traffic_sources_summary_on_collected_on ON ${flyway:defaultSchema}.analytics_traffic_sources_overview_metrics (collected_on)