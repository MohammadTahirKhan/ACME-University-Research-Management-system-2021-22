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
    email TEXT,
    user_type TEXT,
    institution TEXT,
    password TEXT
);

-- Insert records of data into the database:

INSERT INTO posts VALUES(1,"computer science", "computer science", "university of sheffield", "abc.abc.abc");
INSERT INTO posts VALUES(2,"software engineering", "software engineering", "university of sheffield", "bcd.bcd.bcd");
INSERT INTO posts VALUES(3,"AI", "AI", "university of oxford", "cde.cde.cde");


-- Insert records of data into the database:
INSERT INTO users VALUES(1, "admin1","dsf@sheffield.ac.uk", "admin", "UOS","admin1");
INSERT INTO users VALUES(2, "admin2", "abc@sheffield.ac.uk","admin", "UOS", "admin2");
INSERT INTO users VALUES(3, "moderator1", "dcs@sheffield.ac.uk","moderator", "UOS", "moderator1");
INSERT INTO users VALUES(4, "viewer1", "sab@sheffield.ac.uk","viewer", "UOS", "viewer1");
INSERT INTO users VALUES(5, "poster1","dsf@sheffield.ac.uk", "poster", "UOS", "poster1");
