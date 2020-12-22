CREATE TABLE ${flyway:defaultSchema}.monthly_analytics_external_referring_domain_metrics
(
    analytics_external_domain_id bigint        NOT NULL,
    analytics_group_id           bigint        NOT NULL,
    date                         char(8)       NOT NULL,
    external_referring_domain    nvarchar(253) NOT NULL,
    bounce_rate                  decimal(9, 2),
    visits                       bigint,
    created_at                   datetime      NOT NULL DEFAULT CURRENT_TIMESTAMP
)

CREATE NONCLUSTERED INDEX index_monthly_analytics_external_referring_domain_metrics_on_analytics_external_domain_id ON ${flyway:defaultSchema}.monthly_analytics_external_referring_domain_metrics (analytics_external_domain_id)

CREATE NONCLUSTERED INDEX index_monthly_analytics_external_referring_domain_metrics_on_analytics_group_id ON ${flyway:defaultSchema}.monthly_analytics_external_referring_domain_metrics (analytics_group_id)

CREATE NONCLUSTERED INDEX index_monthly_analytics_external_referring_domain_metrics_on_date ON ${flyway:defaultSchema}.monthly_analytics_external_referring_domain_metrics (date)
