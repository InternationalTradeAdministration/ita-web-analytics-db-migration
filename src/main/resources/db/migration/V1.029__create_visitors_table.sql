CREATE TABLE ${flyway:defaultSchema}.visitors
(
    id                 bigint PRIMARY KEY,
    name               nvarchar(4000) NOT NULL,
    country_short_name varchar(2),
    region             nvarchar(4000),
    first_visited      char(26),
    company            bit,
    ignored            bit,
    created_at         datetime       NOT NULL DEFAULT CURRENT_TIMESTAMP
)

CREATE NONCLUSTERED INDEX index_visitors_on_name ON ${flyway:defaultSchema}.visitors (name)

CREATE NONCLUSTERED INDEX index_visitors_on_country_short_name ON ${flyway:defaultSchema}.visitors (country_short_name)
