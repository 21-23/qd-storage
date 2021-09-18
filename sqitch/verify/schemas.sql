-- Verify qd-storage:schemas on pg

begin;

    select pg_catalog.has_schema_privilege('qd_storage', 'usage');
    select pg_catalog.has_schema_privilege('api', 'usage');
    select pg_catalog.has_schema_privilege('auth', 'api', 'usage');

rollback;
