CREATE TABLE ${flyway:defaultSchema}.analytics_country_metrics
(
    analytics_group_id bigint         NOT NULL,
    date               char(8)        NOT NULL,
    country_id         bigint         NOT NULL,
    country_code       nvarchar(10)   NOT NULL,
    country_name       nvarchar(4000) NOT NULL,
    is_region          bit            NOT NULL,
    is_unknown         bit            NOT NULL,
    bounce_rate        decimal(9, 2)  NOT NULL,
    visits             int            NOT NULL,
    created_at         datetime       NOT NULL DEFAULT CURRENT_TIMESTAMP
)

CREATE UNIQUE NONCLUSTERED INDEX index_analytics_country_metrics ON ${flyway:defaultSchema}.analytics_country_metrics (analytics_group_id, date, country_id)

CREATE NONCLUSTERED INDEX index_analytics_country_metrics_on_analytics_group_id ON ${flyway:defaultSchema}.analytics_country_metrics (analytics_group_id)

CREATE NONCLUSTERED INDEX index_analytics_country_metrics_on_date ON ${flyway:defaultSchema}.analytics_country_metrics (date)

CREATE NONCLUSTERED INDEX index_analytics_country_metrics_on_country_id ON ${flyway:defaultSchema}.analytics_country_metrics (country_id)