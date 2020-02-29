require('minitest/autorun')
require('minitest/reporters')
require('pry-byebug')

require_relative('../song.rb')
require_relative('../room.rb')
require_relative('../guest.rb')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class RoomTest < MiniTest::Test

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

    @room1 = Room.new("Room1", 10)
    @room2 = Room.new("Room2", 4)
    @room3 = Room.new("Room3", 2)

    @songs = [@song1, @song2, @song3, @song4, @song5]

    @guest_list_for_test = [@guest1, @guest2]

  end

  def test_room_has_name
    assert_equal("Room1", @room1.name)
  end

  def test_room_has_capacity
    assert_equal(4, @room2.capacity)
  end

  def test_room_has_song_list__empty
    assert_equal(0, @room3.song_list.length)
  end

  def test_room_has_song_list__not_empty
    assert_equal(5, @room3.song_list(@songs).length)
  end

  def test_room_has_song_list__one_song
    assert_equal(1, @room2.song_list(@song3).length)
  end

  def test_room_check_in_guest
    @room2.check_in_guest(@guest1)
    assert_equal(1, @room2.guest_list.length)
  end

  def test_room_check_out_guest
    @room2.check_in_guest(@guest1)
    @room2.check_in_guest(@guest2)
    @room2.check_in_guest(@guest3)
    @room2.check_out_guest(@guest2)
    assert_equal(2, @room2.guest_list.length)
  end

  def test_room_over_capacity
    @room3.check_in_guest(@guest1)
    @room3.check_in_guest(@guest2)
    assert_equal("Room already at capacity", @room3.check_in_guest(@guest3))
  end

  def test_guest_can_afford_entry__true
    @room3.take_entry_fee(@guest1)
    assert_equal(4000, @guest1.wallet)
  end

  def test_guest_can_afford_entry__false
    @room3.take_entry_fee(@guest4)
    assert_equal(500, @guest4.wallet)
  end

end
