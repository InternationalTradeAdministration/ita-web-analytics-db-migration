CREATE TABLE ${flyway:defaultSchema}.analytics_groups_analytics_pages
(
    analytics_group_id bigint NOT NULL,
    analytics_page_id  bigint NOT NULL
)

CREATE UNIQUE NONCLUSTERED INDEX index_analytics_groups_analytics_pages ON ${flyway:defaultSchema}.analytics_groups_analytics_pages (analytics_group_id, analytics_page_id)

CREATE NONCLUSTERED INDEX index_analytics_groups_analytics_pages_on_analytics_group_id ON ${flyway:defaultSchema}.analytics_groups_analytics_pages (analytics_group_id)

CREATE NONCLUSTERED INDEX index_analytics_groups_analytics_pages_on_analytics_page_id ON ${flyway:defaultSchema}.analytics_groups_analytics_pages (analytics_page_id)
