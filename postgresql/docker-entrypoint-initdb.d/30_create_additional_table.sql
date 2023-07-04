-- Table: public.package_thumbnail

-- DROP TABLE IF EXISTS public.package_thumbnail;

CREATE TABLE IF NOT EXISTS public.package_thumbnail
(
    id text COLLATE pg_catalog."default" NOT NULL,
    package_id text COLLATE pg_catalog."default" NOT NULL,
    description text COLLATE pg_catalog."default",
    created time without time zone DEFAULT CURRENT_TIMESTAMP,
    file_name text COLLATE pg_catalog."default",
    CONSTRAINT image_pkey PRIMARY KEY (id),
    CONSTRAINT package_thumbnail_package_id_fkey FOREIGN KEY (package_id)
        REFERENCES public."package" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.package_thumbnail
    OWNER to ckan;
	
-- Table: public.topic

-- DROP TABLE IF EXISTS public.topic;

CREATE TABLE IF NOT EXISTS public.topic
(
    id text COLLATE pg_catalog."default" NOT NULL,
    package_id text COLLATE pg_catalog."default" NOT NULL,
    title text COLLATE pg_catalog."default" NOT NULL,
    body text COLLATE pg_catalog."default",
    created timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    user_id text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT topic_pkey PRIMARY KEY (id),
    CONSTRAINT topic_package_id_fkey FOREIGN KEY (package_id)
        REFERENCES public."package" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT topic_user_id_fkey FOREIGN KEY (user_id)
        REFERENCES public."user" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.topic
    OWNER to ckan;

-- Table: public.comment

-- DROP TABLE IF EXISTS public.comment;

CREATE TABLE IF NOT EXISTS public.comment
(
    id text COLLATE pg_catalog."default" NOT NULL,
    topic_id text COLLATE pg_catalog."default" NOT NULL,
    body text COLLATE pg_catalog."default" NOT NULL,
    created timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    user_id text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT comment_pkey PRIMARY KEY (id),
    CONSTRAINT comment_post_fkey FOREIGN KEY (topic_id)
        REFERENCES public.topic (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT userid_fkey FOREIGN KEY (user_id)
        REFERENCES public."user" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.comment
    OWNER to ckan;