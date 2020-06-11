CREATE TABLE ${flyway:defaultSchema}.analytics_traffic_sources_metrics
(
    analytics_group_id  bigint   NOT NULL,
    analytics_filter_id bigint   NOT NULL,
    timestamp           char(26) NOT NULL,
    direct_traffic      bigint,
    external_referrer   bigint,
    search_domain       bigint,
    social_media        bigint,
    created_at          datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
)

CREATE NONCLUSTERED INDEX index_analytics_traffic_sources_metrics_on_analytics_group_id ON ${flyway:defaultSchema}.analytics_traffic_sources_metrics (analytics_group_id)

CREATE NONCLUSTERED INDEX index_analytics_traffic_sources_metrics_on_analytics_filter_id ON ${flyway:defaultSchema}.analytics_traffic_sources_metrics (analytics_filter_id)

CREATE NONCLUSTERED INDEX index_analytics_traffic_sources_metrics_on_timestamp ON ${flyway:defaultSchema}.analytics_traffic_sources_metrics (timestamp)