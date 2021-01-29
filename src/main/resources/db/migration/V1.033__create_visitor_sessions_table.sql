DROP TABLE IF EXISTS ${flyway:defaultSchema}.visitor_sessions;

CREATE TABLE ${flyway:defaultSchema}.visitor_sessions
(
    id            bigint PRIMARY KEY,
    visitor_id    bigint        NOT NULL,
    date          date          NOT NULL,
    session_start char(26)      NOT NULL,
    page_views    int,
    duration      int,
    source        nvarchar(100) NOT NULL,
    first_visit   bit,
    created_at    datetime      NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE NONCLUSTERED INDEX index_visitor_sessions_on_visitor_id ON ${flyway:defaultSchema}.visitor_sessions (visitor_id);
