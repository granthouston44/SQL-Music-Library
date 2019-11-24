require_relative('../db/SqlRunner')
require_relative('albums')

class Artist

attr_accessor :name
attr_reader :id


  def initialize(artist_details)
    @id = artist_details['id'].to_i() if artist_details['id']
    @name = artist_details['name']
  end

  def save()
    sql = "INSERT INTO artists
    (name) VALUES ($1) RETURNING id"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def Artist.delete_all
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def Artist.all()
    sql = "SELECT * FROM artists"
    artists = SqlRunner.run(sql)
    #we want to call a new artist object as it takes in a hash as a parameter
    #this is evidenced in our initialize and our console
    #the artists variable (result from SqlRunner) will return an array of hashes
    #in the map, we are telling it for each entry in the array, create a new
    #artist object using the hashes contained within the array
    return artists.map{|artist| Artist.new(artist)}
  end

  def update()
    sql = "UPDATE artists SET name = $1 WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def delete_artist
    sql = "DELETE FROM artists WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def Artist.find_by_id(id)
    sql = "SELECT * FROM artists WHERE id = $1"
    #the value of @id would be nil because we're
    #not passing an actual artist object - because
    #its a class method
    #therefore, there will be no id for it to return
    values = [id]

    artists = SqlRunner.run(sql, values)
    return nil if artists.count == 0
    return Artist.new(artists[0])
  end

  def albums
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    #just @id here and not artist_id as we are already in the artist class
    #the @artist_id just points to the artist id by calling artist.id in the console
    #when setting up the album object
    #tehrefore we can skip this step but just calling @id as its the same
    values = [@id]
    artist = SqlRunner.run(sql, values)
    return Album.new(artist[0])
  end


end
