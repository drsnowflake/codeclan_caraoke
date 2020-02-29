class Room

  attr_reader :name, :capacity, :guest_list, :song_list, :revenue

  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @song_list = []
    @guest_list = []
    @entry_fee = 1000
    @revenue = 0

  end


  def add_to_song_list(songs = [])
    songs.kind_of?(Array) ? songs.each { |song| @song_list << song } : @song_list << songs
  end

  def check_in_guest(guest)
    @guest_list.length == @capacity ? "Room already at capacity" : @guest_list << guest
  end

  def check_out_guest(guest)
    @guest_list.delete(guest)
  end

  def entry_fee(guest)
    guest.wallet >= @entry_fee ? take_money(guest, @entry_fee) : "Insufficent funds"
  end

  def sell_drink(guest, drink)
    guest.wallet >= drink.cost ? take_money(guest, drink.cost) : "Insufficent funds"
  end

  def take_money(guest, amount)
    guest.remove_money(amount)
    @revenue += amount
  end

  def fav_song_in_song_list(guest)
    @song_list.include?(guest.fav_song) ? "Whoo!" : "Boo"
  end



end
