-- Deploy qd-storage:api/function/get_token to pg

begin;

    create type api.jwt_token as (
        token text
    );

    create function api.get_token(role text)
    returns api.jwt_token as
    $$
        select sign(
            row_to_json(claims),
            current_setting('qd_storage.jwt_secret')
        ) as token
        from (
            select
                role                                     as role,
                extract(epoch from now())::integer + 300 as exp
        ) claims

    $$ language sql immutable;

    grant execute on function api.get_token(text) to auth;

commit;
