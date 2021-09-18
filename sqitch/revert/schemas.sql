-- Revert qd-storage:schemas from pg

begin;

    drop schema qd_storage;
    drop schema api;

commit;
