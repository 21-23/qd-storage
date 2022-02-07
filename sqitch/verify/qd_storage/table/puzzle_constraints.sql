-- Verify qd-storage:qd_storage/table/puzzle-constraints on pg

begin;

    select * from qd_storage.puzzle_constraints limit 1;

rollback;
