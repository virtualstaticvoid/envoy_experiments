--
-- can be used to initialize postgres when being installed
-- such as seeding databases, creating objects, etc.
--
-- only runs once ~ I.e. not each time docker starts the container!
--

-- create database

create database exampledb;

-- connext to this database

\c exampledb

-- create table

create table public.example (
  id integer not null,
  name character varying,
  description character varying
);

create sequence public.example_id_seq
  start with 1
  increment by 1
  no minvalue
  no maxvalue
  cache 1;

alter sequence public.example_id_seq
	owned by public.example.id;

alter table only public.example
	alter column id set default nextval('public.example_id_seq'::regclass);

alter table only public.example
  add constraint example_pkey primary key (id);

create unique index index_example_on_name
	on public.example using btree (name);

-- insert sample data

insert into example ( name, description ) values
	( 'CODE1', 'Item 1' ),
	( 'CODE2', 'Item 2' ),
	( 'CODE3', 'Item 3' ),
	( 'CODE4', 'Item 4' ),
	( 'CODE5', 'Item 5' ),
	( 'CODE6', 'Item 6' );
