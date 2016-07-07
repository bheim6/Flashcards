gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require './lib/guess'
require './lib/round'

require './lib/card_generator'

class CardGeneratorTest < Minitest::Test

  def test_pool_cards_from_file
    file = "lib/cards.txt"
    deck = CardGenerator.new(file).cards
    # require "pry" ; binding.pry
  end

end
