CREATE TABLE ${flyway:defaultSchema}.content_groups_pages
(
    content_group_id bigint NOT NULL,
    page_id  bigint NOT NULL
)

CREATE UNIQUE NONCLUSTERED INDEX content_groups_pages ON ${flyway:defaultSchema}.content_groups_pages (content_group_id, page_id)

CREATE NONCLUSTERED INDEX index_content_groups_pages_on_content_group_id ON ${flyway:defaultSchema}.content_groups_pages (content_group_id)

CREATE NONCLUSTERED INDEX index_content_groups_pages_on_page_id ON ${flyway:defaultSchema}.content_groups_pages (page_id)