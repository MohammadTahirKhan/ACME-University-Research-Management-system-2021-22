CREATE TABLE posts (
    id INTEGER PRIMARY KEY,
    title TEXT,
    topic TEXT,
    institution TEXT,
    link TEXT
);

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    username TEXT,
    user_type TEXT,
    institution TEXT,
    password TEXT
);

-- Insert records of data into the database:

INSERT INTO posts VALUES(1,"Dominic", "Calvert-Lewin", "M", "Everton");
INSERT INTO posts VALUES(2,"Sam", "Kerr", "F", "Chelsea");


-- Insert records of data into the database:

INSERT INTO users VALUES(1, "Dominic", "M", "uos","Everton");
INSERT INTO users VALUES(2, "Sam", "abc", "sheffield", "Chelsea");
