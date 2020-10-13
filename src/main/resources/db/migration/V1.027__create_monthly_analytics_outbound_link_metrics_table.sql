CREATE TABLE ${flyway:defaultSchema}.monthly_analytics_outbound_link_metrics
(
    analytics_outbound_link_id bigint         NOT NULL,
    analytics_group_id         bigint         NOT NULL,
    date                       char(8)        NOT NULL,
    title                      nvarchar(4000),
    url                        nvarchar(4000) NOT NULL,
    pages                      bigint,
    visits                     bigint,
    created_at                 datetime       NOT NULL DEFAULT CURRENT_TIMESTAMP
)

CREATE NONCLUSTERED INDEX index_monthly_analytics_outbound_link_metrics_on_analytics_outbound_link_id ON ${flyway:defaultSchema}.monthly_analytics_outbound_link_metrics (analytics_outbound_link_id)

CREATE NONCLUSTERED INDEX index_monthly_analytics_outbound_link_metrics_on_analytics_group_id ON ${flyway:defaultSchema}.monthly_analytics_outbound_link_metrics (analytics_group_id)

CREATE NONCLUSTERED INDEX index_monthly_analytics_outbound_link_metrics_on_date ON ${flyway:defaultSchema}.monthly_analytics_outbound_link_metrics (date)
