select * from parts limit 10;

alter table parts
alter column code set not null;

alter table parts
add unique (code);

update parts
set description = 'Need Description'
where description is null
  or description = ' ';

alter table parts
alter column description
set not null;

-- insert into parts (id, code, manufacturer_id)
-- values (54, 'V1-009', 9);

insert into parts (id, code, manufacturer_id, description)
values (54, 'V1-009', 9, 'Cat');

alter table reorder_options
alter column quantity set not null;

alter table reorder_options
alter column price_usd set not null;

alter table reorder_options
add check (price_usd > 0 and quantity > 0 );

alter table reorder_options
add check (price_usd / quantity > 0.02 and price_usd / quantity < 25.00);

alter table parts
add primary key (id);

alter table reorder_options
add foreign key (part_id)
references parts (id);

alter table locations
add check (qty > 0);

alter table locations
add unique (part_id, location);

alter table locations
add foreign key (part_id)
references parts (id);

alter table parts
add foreign key (manufacturer_id )
references manufacturers (id);


insert into manufacturers
values (11, 'Pip-NNC');

update parts
set manufacturer_id = 11
where manufacturer_id in (1, 2);






















