-- Create a new logical database
create database app;

-- Connect to the new database
\c app

-- Create tables and seed data
create table outbox (
    message_id uuid primary key,
    message jsonb
);

alter table outbox replica identity full;

create publication sequin_pub for table outbox;

select pg_create_logical_replication_slot('sequin_slot', 'pgoutput');
