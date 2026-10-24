create table contracts  (
  id                       bigint generated always as identity primary key,
  building_id              bigint references buildings(id) not null,
  apartment_number         text,
  phone                    text not null,
  first_name               text,
  last_name                text,
  email                    text,
  debt_cents               integer default 0 not null,  
  is_active                boolean default true not null

);


create unique index one_active_contract_per_apartment
  on contracts (apartment_number, building_id) nulls not distinct
  where is_active = true;