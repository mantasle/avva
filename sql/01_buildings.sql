create table buildings (
  id       bigint generated always as identity primary key,
  street   text not null,
  house_number   text not null,

  unique (street,house_number)
);