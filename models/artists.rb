class Artist

attr_accessor :name
attr_reader :id


  def initialize(artist_details)
    @id = artist_details['id'].to_i() if artist_details['id']
    @name = artist_details['name']
  end






end
