create table plans (
  id       bigint generated always as identity primary key,
  name     text not null unique
);


create table plan_prices (
  id                              bigint generated always as identity primary key,
  plan_id                         bigint not null references plans(id),
  price_cents                     integer not null check (price_cents > 0),
  price_with_extra_channels_cents integer check (price_with_extra_channels_cents > 0),
  valid_from                      date not null default current_date,
  unique (plan_id, valid_from)
);
