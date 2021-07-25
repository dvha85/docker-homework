CREATE TABLE book (
	id SERIAL PRIMARY KEY NOT NULL,
	owner_id int NOT NULL,
    name VARCHAR (255) UNIQUE NOT NULL,
	description text,
	creation_time timestamp default CURRENT_TIMESTAMP,
    update_time timestamp  default CURRENT_TIMESTAMP,
    deleted boolean DEFAULT false NOT NULL
);