CREATE TABLE posts (
    poster_name text,
    id INTEGER PRIMARY KEY,
    title TEXT,
    topic TEXT,
    institution TEXT,
    sponsor TEXT,
    link TEXT,
    content TEXT,
    approved TEXT
    
);

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    username TEXT,
    email TEXT,
    user_type TEXT,
    institution TEXT,
    password TEXT,
    suspended TEXT,
    password_reset TEXT
);

