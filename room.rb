class Room

  attr_reader :name, :capacity, :guest_list, :song_list

  def initialize(name, capacity, guest_list = [], song_list = [])
    @name = name
    @capacity = capacity
    @song_list = song_list
    @guest_list = guest_list
  end


  def song_list(songs = [])
    songs.kind_of?(Array) ? songs.each { |song| @song_list << song } : @song_list << songs
  end

  def check_in_guest(guest)
    @guest_list.length == @capacity ? "Room already at capacity" : @guest_list << guest
  end

  def check_out_guest(guest)
    @guest_list.delete(guest)
  end

  def take_entry_fee(guest)
    guest.wallet >= 1000 ? guest.remove_money(1000) : "Insufficent funds"
  end

end
