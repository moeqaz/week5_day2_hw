-- CREATE the theater table
CREATE TABLE movie_theater(
	store_id SERIAL PRIMARY KEY, -- PRIMARY KEY specifies BOTH UNIQUE AND NOT NULL
	store_name VARCHAR(20) NOT NULL, -- NOT NULL means that this COLUMN cannot be EMPTY 
	address VARCHAR(100) NOT NULL,
	employee_id INTEGER NOT NULL
);

SELECT *
FROM movie_theater;

-- CREATE the customer table
CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	customer_age INTEGER NOT NULL,
	email VARCHAR(50),
	loyalty_member BOOLEAN DEFAULT FALSE
);

SELECT *
FROM customer;


-- CREATE the tickets table
CREATE TABLE tickets(
	ticket_id SERIAL PRIMARY KEY,
	date_ TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
	showtime TIMESTAMP,
	price NUMERIC(5,2),
	room INTEGER NOT NULL
);

ALTER TABLE tickets
ADD FOREIGN KEY(customer_id) REFERENCES customer(customer_id);



-- Create Purchase-Ticket Table (Join Table between the Tickets and Movies table)
CREATE TABLE purchase_ticket(
	ticket_id INTEGER NOT NULL,
	FOREIGN KEY(ticket_id) REFERENCES tickets(ticket_id),
	movie_id INTEGER NOT NULL,
	FOREIGN KEY(movie_id) REFERENCES movies(movie_id)
);


-- Create the movies table
CREATE TABLE movies(
	movie_id SERIAL PRIMARY KEY,
	title VARCHAR(100),
	rating VARCHAR(10),
	description VARCHAR(200),
	price NUMERIC(5,2),
	room_number INTEGER
);

SELECT *
FROM movies;


-- Create the category table
CREATE TABLE category(
	category_id SERIAL PRIMARY KEY,
	genre VARCHAR(20)
);


-- ADD store_id and category_id to movies 
ALTER TABLE movies 
ADD COLUMN store_id INTEGER NOT NULL;

ALTER TABLE movies 
ADD COLUMN category_id INTEGER NOT NULL;

-- Add foreign keys to those new columns
ALTER TABLE movies 
ADD FOREIGN KEY(store_id) REFERENCES movie_theater(store_id);

ALTER TABLE movies 
ADD FOREIGN KEY(category_id) REFERENCES category(category_id);



















