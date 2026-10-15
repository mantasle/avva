alter table buildings
  add column fed_by_device_id  bigint references devices(id);