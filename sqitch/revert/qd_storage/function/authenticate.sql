-- Revert qd-storage:qd_storage/function/authenticate from pg

begin;

    drop function api.authenticate;

commit;
