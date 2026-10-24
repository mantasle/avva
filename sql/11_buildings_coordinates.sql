ALTER TABLE buildings 
  ADD lng double precision,
  ADD lat double precision,
  add constraint buildings_coords_check check ((lng is null and lat is null) or (lng is not null and lat is not null));
