CREATE TABLE ${flyway:defaultSchema}.country_names
(
    country_code char(2)        NOT NULL,
    country_name nvarchar(4000) NOT NULL
)

CREATE UNIQUE NONCLUSTERED INDEX index_country_names ON ${flyway:defaultSchema}.country_names (country_code)