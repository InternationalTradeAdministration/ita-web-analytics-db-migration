CREATE TABLE ${flyway:defaultSchema}.triggers_visitor_sessions
(
    trigger_id         bigint NOT NULL,
    visitor_session_id bigint NOT NULL,
    count              int    NOT NULL
);

CREATE UNIQUE NONCLUSTERED INDEX index_triggers_visitor_sessions ON ${flyway:defaultSchema}.triggers_visitor_sessions (trigger_id, visitor_session_id);
