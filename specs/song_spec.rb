require('minitest/autorun')
require('minitest/reporters')

require_relative('../song.rb')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class SongTest < MiniTest::Test

  def setup
    @song1 = Song.new("Gerry Cinnaomon", "Canter")
    @song2 = Song.new("Blur", "Song 2")
    @song3 = Song.new("Gloryhammer", "Rise of the Chaos Wizards")
    @song4 = Song.new("Kontrust", "Hey DJ!")
    @song5 = Song.new("The Communards", "Never can say goodbye")
  end

  def test_song_has_artist
    assert_equal("Blur", @song2.artist)
  end

  def test_song_has_title
    assert_equal("Hey DJ!", @song4.title)
  end

end
