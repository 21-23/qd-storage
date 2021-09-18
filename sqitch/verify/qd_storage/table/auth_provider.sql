-- Verify qd-storage:qd_storage/table/auth_provider on pg

begin;

    select * from qd_storage.auth_provider limit 1;

rollback;
