-- Create a table: ("--" denotes the start of a comment in SQL)
CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    username TEXT,
    user_type TEXT,
    institution TEXT,
    password TEXT
);

-- Insert records of data into the database:

INSERT INTO players VALUES(1, "test_user1", "viewer", "University of Sheffield", "password");
INSERT INTO players VALUES(2, "test_user2", "admin", "University of Manchester", "12345");
