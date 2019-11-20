require('minitest/autorun')
require('minitest/reporters')
require_relative('../models/albums')

MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

class AlbumTest < MiniTest::Test

  def test_can_create_new_album
    album_details = {
      'name' => 'Dude Ranch',
      'genre' => 'Pop-punk'
    }

    new_album = Album.new(album_details)
    assert_equal('name', new_album.name)

  end

end
