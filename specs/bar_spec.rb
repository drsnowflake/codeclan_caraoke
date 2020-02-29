require('minitest/autorun')
require('minitest/reporters')

require_relative('../bar.rb')
require_relative('../drink.rb')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class BarTest < MiniTest::Test

  def setup
    @bar1 = Bar.new()
    @bar2 = Bar.new()

    @drink1 = Drink.new(500, "Beer")
    @drink2 = Drink.new(750, "Wine")
    @drink3 = Drink.new(1000, "Cocktail")

    @drink_list = [@drink1, @drink2, @drink3]
    end

  def test_bar_has_drink_list
    @bar1.add_to_drink_list(@drink_list)
    assert_equal(3, @bar1.drink_list.length)
  end

end
