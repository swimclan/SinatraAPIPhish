CREATE DATABASE restfulphish;

\c restfulphish

CREATE TABLE songs (id SERIAL PRIMARY KEY, name VARCHAR(255), album VARCHAR(255), track_length VARCHAR(255), release_date DATE, album_cover VARCHAR(65535));