create table staircases (
  id       bigint generated always as identity primary key,
  building_id   bigint not null references buildings(id),
  number   integer not null,
  door_code       text,

  unique (building_id, number)
);  