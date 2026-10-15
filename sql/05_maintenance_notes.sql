create table maintenance_notes (
  id                       bigint generated always as identity primary key,
  building_id              bigint references buildings(id) not null,
  noted_on                 date not null default current_date,
  note                     text not null
);


