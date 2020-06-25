CREATE TABLE ${flyway:defaultSchema}.quality_assurance_summary_metrics
(
    content_group_id               bigint   NOT NULL,
    broken_links                   int      NOT NULL,
    broken_links_delta             int      NOT NULL,
    clicks_on_broken_links         int      NOT NULL,
    misspellings                   int      NOT NULL,
    misspellings_delta             int      NOT NULL,
    pages                          int      NOT NULL,
    pages_affected_by_broken_links int      NOT NULL,
    pages_affected_by_misspellings int      NOT NULL,
    potential_misspellings         int      NOT NULL,
    created_at                     datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
)

CREATE NONCLUSTERED INDEX index_quality_assurance_summary_metrics_on_content_group_id ON ${flyway:defaultSchema}.quality_assurance_summary_metrics (content_group_id)