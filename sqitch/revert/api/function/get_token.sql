-- Revert qd-storage:api/function/get_token from pg

begin;

    drop function api.get_token;
    drop type api.jwt_token;

commit;
