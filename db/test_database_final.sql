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

INSERT INTO posts VALUES(9,"Dominic", "Calvert-Lewin", "M", "Everton");
INSERT INTO posts VALUES(7,"Sam", "Kerr", "F", "Chelsea");


-- Insert records of data into the database:

INSERT INTO users VALUES(1, "Dominic", "M", "uos","Everton");
INSERT INTO users VALUES(2, "Sam", "abc", "sheffield", "Chelsea");
INSERT INTO users VALUES(3, "abcd", "sadasd", "sajdaksjfn", "sakjh");
INSERT INTO users VALUES(4, "wuqdh", "sabc", "jsjsj", "nsbd");
INSERT INTO users VALUES(5, "jsakdh", "ksand", "zzz", "sjabd");

