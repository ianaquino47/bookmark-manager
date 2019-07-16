CREATE DATABASE "bookmark_manager";
\c bookmark_manager;
CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60));
INSERT INTO bookmarks (url) VALUES('www.google.com');
INSERT INTO bookmarks (url) VALUES('www.makersacademy.com');
INSERT INTO bookmarks (url) VALUES('www.youtube.com');
INSERT INTO bookmarks (url) VALUES('www.facebook.com');
