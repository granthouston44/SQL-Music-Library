require_relative('../db/SqlRunner')
require_relative('artists')

class Album

attr_accessor :name, :genre
attr_reader :id, :artist_id

def initialize(album_details)
  @id = album_details['id'].to_i
  @name = album_details['name']
  @genre = album_details['genre']
  @artist_id = album_details['artist_id'].to_i
end

def save()
  sql = "INSERT INTO albums (name, genre, artist_id) VALUES ($1, $2, $3) RETURNING id"
  values = [@name, @genre, @artist_id]
  result = SqlRunner.run(sql,values)
  @id = result[0]['id'].to_i
end

def self.delete_all
  sql = "DELETE FROM albums"
  SqlRunner.run(sql)
end

def delete_album
  sql = "DELETE FROM albums WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
end

def self.all
  sql = "SELECT * FROM albums"
  albums = SqlRunner.run(sql)
  return albums.map {|album| Album.new(album)}
end

def update_album
  sql = "UPDATE albums SET (name, genre)
  = ($1, $2) WHERE id = $3
  "
  values = [@name, @genre, @id]
  SqlRunner.run(sql, values)
end

def self.find_by_id(id)
  sql = "SELECT * FROM albums WHERE id = $1"
  values = [id]
  albums = SqlRunner.run(sql, values)
  return nil if albums.count == 0
  return albums.map {|album| Album.new(album)}
end

def artist
  sql = "SELECT * FROM artists WHERE id = $1"
  values = [@artist_id]
  artist = SqlRunner.run(sql, values)
  return Artist.new(artist[0])
end

end
