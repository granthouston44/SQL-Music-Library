require('pry')
require_relative('models/artists')
require_relative('models/albums')

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({
  'name' => 'blink-182'
  })

  artist2 = Artist.new({
    'name' =>'AC/DC'
    })

    artist1.save()
    artist2.save()

    album1 = Album.new({
      'name' => 'Dude Ranch',
      'genre' => 'Pop-punk',
      'artist_id' => artist1.id
      })

      album1.save()

      album2 = Album.new({
        'name' => 'Back in Black',
        'genre' => 'Hard Rock',
        'artist_id' => artist2.id
        })

      album2.save()
      
        binding.pry
        nil
