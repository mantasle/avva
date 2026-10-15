create table disconnection_tasks (
  id       bigint generated always as identity primary key,
  month                   date not null check (extract(day from month) = 1),
  created_by              uuid references  profiles(id) on delete set null,
  is_completed            boolean default false not null,
  unique(month)
);

create table disconnection_task_items (
  id                  bigint generated always as identity primary key,
  task_id             bigint  not null references disconnection_tasks(id) on delete cascade,
  contract_id         bigint not null references contracts(id),
  comment             text,
  is_disconnected     boolean not null default false,
  unique(contract_id,task_id)
);
