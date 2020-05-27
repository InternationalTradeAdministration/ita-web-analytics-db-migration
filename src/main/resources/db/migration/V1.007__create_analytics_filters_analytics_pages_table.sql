CREATE TABLE ${flyway:defaultSchema}.analytics_filters_analytics_pages
(
    analytics_filter_id bigint NOT NULL,
    analytics_page_id  bigint NOT NULL
)

CREATE UNIQUE NONCLUSTERED INDEX analytics_filters_analytics_pages ON ${flyway:defaultSchema}.analytics_filters_analytics_pages (analytics_filter_id, analytics_page_id)

CREATE NONCLUSTERED INDEX index_analytics_filters_analytics_pages_on_analytics_filter_id ON ${flyway:defaultSchema}.analytics_filters_analytics_pages (analytics_filter_id)

CREATE NONCLUSTERED INDEX index_analytics_filters_analytics_pages_on_analytics_page_id ON ${flyway:defaultSchema}.analytics_filters_analytics_pages (analytics_page_id)