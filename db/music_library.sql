DROP TABLE IF EXISTS albums;

DROP TABLE IF EXISTS artists;

CREATE TABLE artists(
  id SERIAL PRIMARY KEY,
  name VARCHAR
);

CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  name VARCHAR,
  genre VARCHAR,
  artist_id INT REFERENCES artists(id)
);
