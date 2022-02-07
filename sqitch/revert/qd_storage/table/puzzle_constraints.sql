-- Revert qd-storage:qd_storage/table/puzzle-constraints from pg

begin;

    drop table qd_storage.puzzle_constraints;

commit;
