-- Verify qd-storage:qd_storage/table/puzzle on pg

begin;

    select * from qd_storage.puzzle limit 1;

rollback;
