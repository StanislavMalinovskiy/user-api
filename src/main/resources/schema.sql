create schema if not exists demo;

create table if not exists demo.users
(
    id     bigserial
        primary key,
    dob    date,
    dt     timestamp(6) not null,
    email  varchar(255),
    fio    varchar(255) not null,
    phone  bigint,
    status integer
);

alter table demo.users
    owner to postgres;

create table if not exists demo.cards
(
    id          bigserial
        primary key,
    balance     bigint,
    card_expire varchar(255),
    card_name   varchar(255),
    card_number varchar(255),
    card_type   varchar(3),
    dt          timestamp(6) not null,
    status      integer,
    user_id     bigint
        constraint fkcmanafgwbibfijy2o5isfk3d5
            references demo.users
);

alter table demo.cards
    owner to postgres;

create table if not exists demo.cards_transactions
(
    id          bigserial
        primary key,
    amount      bigint,
    dt          timestamp(6) not null,
    new_balance bigint,
    old_balance bigint,
    type        varchar(255),
    card_id     bigint
        constraint fk77no867y6iisv1mupc3wlstl9
            references demo.cards,
    user_id     bigint
        constraint fknd88ygd9kruvuoc6wc1yhtpfq
            references demo.users
);

alter table demo.cards_transactions
    owner to postgres;

