CREATE TABLE ${flyway:defaultSchema}.quality_assurance_inventory_metrics
(
    content_group_id bigint         NOT NULL,
    timestamp        char(26)       NOT NULL,
    data_category    nvarchar(4000) NOT NULL,
    count            int            NOT NULL,
    created_at       datetime       NOT NULL DEFAULT CURRENT_TIMESTAMP
)

CREATE UNIQUE NONCLUSTERED INDEX index_quality_assurance_inventory_metrics ON ${flyway:defaultSchema}.quality_assurance_inventory_metrics (content_group_id, timestamp, data_category)

CREATE NONCLUSTERED INDEX index_quality_assurance_inventory_metrics_on_content_group_id ON ${flyway:defaultSchema}.quality_assurance_inventory_metrics (content_group_id)

CREATE NONCLUSTERED INDEX index_quality_assurance_inventory_metrics_on_timestamp ON ${flyway:defaultSchema}.quality_assurance_inventory_metrics (timestamp)

CREATE NONCLUSTERED INDEX index_quality_assurance_inventory_metrics_on_data_category ON ${flyway:defaultSchema}.quality_assurance_inventory_metrics (data_category)