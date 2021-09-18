-- Verify qd-storage:qd_storage/table/user on pg

begin;

    select * from qd_storage.user limit 1;

rollback;
