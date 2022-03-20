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
INSERT INTO users VALUES(1, "admin","abc@sheffield.ac.uk", "admin", "UOS","admin");
INSERT INTO users VALUES(2, "reporter1","bce@sheffield.ac.uk", "poster", "UOS", "reporter1");
INSERT INTO users VALUES(3, "reporter2","ced@sheffield.ac.uk", "poster", "UOS", "reporter2");
INSERT INTO users VALUES(4, "moderator", "def@sheffield.ac.uk","moderator", "UOS", "moderator");
INSERT INTO users VALUES(5, "viewer1", "sab@sheffield.ac.uk","viewer", "UOS", "viewer1");
INSERT INTO users VALUES(6, "viewer2","dsf@sheffield.ac.uk", "viewer", "UOS", "viewer2");
