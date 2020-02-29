class Guest

  attr_reader :name, :wallet, :fav_song

  def initialize(name, wallet, fav_song = nil)
    @name = name
    @wallet = wallet
    @fav_song = fav_song
  end

  def remove_money(amount)
    @wallet -= amount
  end

end
