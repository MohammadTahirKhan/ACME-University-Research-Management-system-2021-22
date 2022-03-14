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
INSERT INTO users VALUES(1, "Dominic","dsf", "M", "uos","Everton");
INSERT INTO users VALUES(2, "Sam", "abc","dsf", "sheffield", "Chelsea");
INSERT INTO users VALUES(3, "abcd", "sadasd","dsf", "sajdaksjfn", "sakjh");
INSERT INTO users VALUES(4, "wuqdh", "sabc","dsf", "jsjsj", "nsbd");
INSERT INTO users VALUES(5, "jsakdh","dsf", "ksand", "zzz", "sjabd");

