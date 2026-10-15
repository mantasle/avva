create type profile_role as enum ('admin', 'manager', 'technician');

create table profiles (
  id   uuid primary key references auth.users(id) on delete cascade,
  full_name               text not null,
  role                    profile_role not null default 'technician'
);
