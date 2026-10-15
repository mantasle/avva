create type device_type as enum ('optical_converter', 'amp_with_socket_power', 'amp_with_cable_power');

create table devices   (
  id                       bigint generated always as identity primary key,
  type                     device_type not null,
  location_note            text,
  installed_in_building_id bigint references buildings(id),
  parent_device_id         bigint references devices(id)
);
