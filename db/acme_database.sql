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

INSERT INTO posts VALUES(9,"Dominic", "Calvert-Lewin", "M", "Everton");
INSERT INTO posts VALUES(7,"Sam", "Kerr", "F", "Chelsea");


-- Insert records of data into the database:
INSERT INTO users VALUES(1, "admin1","dsf", "admin", "uos","admin1");
INSERT INTO users VALUES(2, "admin2", "abc","admin", "sheffield", "admin2");
INSERT INTO users VALUES(3, "moderator1", "sadasd","moderator", "sajdaksjfn", "moderator1");
INSERT INTO users VALUES(4, "viewer1", "sabc","viewer", "jsjsj", "viewer1");
INSERT INTO users VALUES(5, "poster1","dsf", "poster", "zzz", "poster1");

