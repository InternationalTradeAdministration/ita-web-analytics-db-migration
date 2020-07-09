CREATE TABLE ${flyway:defaultSchema}.content_groups_content_pages
(
    content_group_id bigint NOT NULL,
    content_page_id  bigint NOT NULL
)

CREATE UNIQUE NONCLUSTERED INDEX index_content_groups_content_pages ON ${flyway:defaultSchema}.content_groups_content_pages (content_group_id, content_page_id)

CREATE NONCLUSTERED INDEX index_content_groups_content_pages_on_content_group_id ON ${flyway:defaultSchema}.content_groups_content_pages (content_group_id)

CREATE NONCLUSTERED INDEX index_content_groups_content_pages_on_content_page_id ON ${flyway:defaultSchema}.content_groups_content_pages (content_page_id)