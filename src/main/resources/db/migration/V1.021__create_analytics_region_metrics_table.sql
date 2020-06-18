CREATE TABLE ${flyway:defaultSchema}.analytics_region_metrics
(
    analytics_group_id bigint         NOT NULL,
    date               char(8)        NOT NULL,
    country_id         bigint         NOT NULL,
    region_id          bigint         NOT NULL,
    region             nvarchar(4000) NOT NULL,
    is_unknown         bit            NOT NULL,
    bounce_rate        decimal(9, 2)  NOT NULL,
    visits             int            NOT NULL,
    created_at         datetime       NOT NULL DEFAULT CURRENT_TIMESTAMP
)

CREATE UNIQUE NONCLUSTERED INDEX index_analytics_region_metrics ON ${flyway:defaultSchema}.analytics_region_metrics (analytics_group_id, date, region_id)

CREATE NONCLUSTERED INDEX index_analytics_region_metrics_on_analytics_group_id ON ${flyway:defaultSchema}.analytics_region_metrics (analytics_group_id)

CREATE NONCLUSTERED INDEX index_analytics_region_metrics_on_date ON ${flyway:defaultSchema}.analytics_region_metrics (date)

CREATE NONCLUSTERED INDEX index_analytics_region_metrics_on_country_id ON ${flyway:defaultSchema}.analytics_region_metrics (country_id)

CREATE NONCLUSTERED INDEX index_analytics_region_metrics_on_region_id ON ${flyway:defaultSchema}.analytics_region_metrics (region_id)