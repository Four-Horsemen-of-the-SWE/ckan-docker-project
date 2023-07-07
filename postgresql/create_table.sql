-- create_table.sql
CREATE TABLE IF NOT EXISTS public.test_create_table_via_docker
(
    id text COLLATE pg_catalog."default" NOT NULL,
    test text COLLATE pg_catalog."default",
    CONSTRAINT test_pk PRIMARY KEY (id)
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.test_create_table_via_docker
    OWNER to ckan;

-- create_table.sql

-- Create the table in the public schema
CREATE TABLE IF NOT EXISTS public.my_table (
    id serial PRIMARY KEY,
    name text,
    age integer
);

-- Grant permissions to the CKAN user
GRANT ALL PRIVILEGES ON TABLE public.my_table TO ckan;

-- Create an index on the name column
CREATE INDEX IF NOT EXISTS idx_my_table_name ON public.my_table (name);
