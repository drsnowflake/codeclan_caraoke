require('minitest/autorun')
require('minitest/reporters')

require_relative('../song.rb')
require_relative('../guest.rb')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class GuestTest < MiniTest::Test

  def setup
    @song1 = Song.new("Gerry Cinnaomon", "Canter")
    @song2 = Song.new("Blur", "Song 2")
    @song3 = Song.new("Gloryhammer", "Rise of the Chaos Wizards")
    @song4 = Song.new("Kontrust", "Hey DJ!")
    @song5 = Song.new("The Communards", "Never can say goodbye")

    @guest1 = Guest.new("Rob", 5000, @song3)
    @guest2 = Guest.new("Angela", 7500, @song1)
    @guest3 = Guest.new("Jura", 2000, @song2)
    @guest4 = Guest.new("Cat", 500)

  end

  def test_guest_has_name
    assert_equal("Rob", @guest1.name)
  end

  def test_guest_has_wallet
    assert_equal(7500, @guest2.wallet)
  end

  def test_guest_has_fav_song__true
    assert_equal(@song3, @guest1.fav_song)
  end

  def test_guest_has_fav_song__false
    assert_nil(@guest4.fav_song)
  end
end
