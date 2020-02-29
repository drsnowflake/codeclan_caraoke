require('minitest/autorun')
require('minitest/reporters')
require('pry-byebug')

require_relative('../bar.rb')
require_relative('../song.rb')
require_relative('../room.rb')
require_relative('../drink.rb')
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
    @guest3 = Guest.new("Jura", 2000, @song5)
    @guest4 = Guest.new("Cat", 500)

    @room1 = Room.new("Room1", 10)
    @room2 = Room.new("Room2", 4)
    @room3 = Room.new("Room3", 2)

    @songs = [@song1, @song2, @song3, @song4, @song5]

    @guest_list_for_test = [@guest1, @guest2]

    @bar1 = Bar.new()
    @bar2 = Bar.new()

    @drink1 = Drink.new(500, "Beer")
    @drink2 = Drink.new(750, "Wine")
    @drink3 = Drink.new(1000, "Cocktail")

    @drink_list = [@drink1, @drink2, @drink3]
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
    assert_equal(5, @room3.add_to_song_list(@songs).length)
  end

  def test_room_has_song_list__one_song
    assert_equal(1, @room2.add_to_song_list(@song3).length)
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
    @room3.entry_fee(@guest1)
    assert_equal(4000, @guest1.wallet)
  end

  def test_guest_can_afford_entry__false
    @room3.entry_fee(@guest4)
    assert_equal(500, @guest4.wallet)
  end

  def test_room_has_guest_fav_song__true
    @room3.add_to_song_list(@song5)
    assert_equal("Whoo!", @room3.fav_song_in_song_list(@guest3))
  end

  def test_room_has_guest_fav_song__false
    @room3.add_to_song_list(@song4)
    assert_equal("Boo", @room3.fav_song_in_song_list(@guest3))
  end

  def test_room_has_revenue
    assert_equal(0, @room2.revenue)
  end

  def test_room_made_revenue
    @room2.entry_fee(@guest1)
    assert_equal(1000, @room2.revenue)
  end

  def test_guest_buys_drink
    @room2.sell_drink(@guest1, @drink3)
    assert_equal(4000, @guest1.wallet)
    assert_equal(1000, @room2.revenue)
  end

end
