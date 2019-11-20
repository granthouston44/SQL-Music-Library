require('minitest/autorun')
require('minitest/reporters')
require_relative('../models/artists')

MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

class ArtistTest < MiniTest::Test

  def test_can_create_new_artist
    artist_details = {
      'name' => 'blink-182'
    }


    new_artist = Artist.new(artist_details)
    assert_equal('blink-182', new_artist.name)


  end






end
