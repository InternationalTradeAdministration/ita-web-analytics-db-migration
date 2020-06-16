CREATE TABLE ${flyway:defaultSchema}.analytics_visit_length_metrics
(
    analytics_group_id                bigint   NOT NULL,
    analytics_filter_id               bigint   NOT NULL,
    timestamp                         char(26) NOT NULL,
    visit_duration_average_in_minutes decimal(9, 2),
    created_at                        datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
)

CREATE NONCLUSTERED INDEX index_analytics_visit_length_metrics_on_group_id ON ${flyway:defaultSchema}.analytics_visit_length_metrics (analytics_group_id)

CREATE NONCLUSTERED INDEX index_analytics_visit_length_metrics_on_filter_id ON ${flyway:defaultSchema}.analytics_visit_length_metrics (analytics_filter_id)

CREATE NONCLUSTERED INDEX index_analytics_visit_length_metrics_on_timestamp ON ${flyway:defaultSchema}.analytics_visit_length_metrics (timestamp)