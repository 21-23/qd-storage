-- Deploy qd-storage:api/function/get_token to pg

begin;

    create type api.jwt_token as (
        token text
    );

    create function api.get_token(role text, extras jsonb)
    returns api.jwt_token as
    $$
        select sign(
            (to_jsonb(claims) || extras)::json,
            current_setting('qd_storage.jwt_secret')
        ) as token
        from (
            select
                role                                     as role,
                extract(epoch from now())::integer + 300 as exp
        ) claims

    $$ language sql volatile;

    grant execute on function api.get_token(text, jsonb) to auth;

commit;
