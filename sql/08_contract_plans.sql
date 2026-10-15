create table contract_plans (
  id                              bigint generated always as identity primary key,
  contract_id                         bigint not null references contracts(id),
  plan_id                         bigint not null references plans(id),
  quantity                     integer not null default 1 check (quantity> 0),
  unique(plan_id,contract_id)
);
