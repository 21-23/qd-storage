-- Verify qd-storage:schemas on pg

begin;

    select pg_catalog.has_schema_privilege('qd_storage', 'usage');

rollback;
