class Bar

  attr_reader :drink_list

  def initialize()
    @drink_list = []
  end

  def add_to_drink_list(drinks = [])
    drinks.kind_of?(Array) ? drinks.each { |drink| @drink_list << drinks } : @drink_list << drinks
  end

end
