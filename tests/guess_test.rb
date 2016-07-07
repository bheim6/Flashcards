gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess'

class GuessTest < Minitest::Test

  def test_it_has_a_response
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_equal "Juneau", guess.response
  end

  def test_the_response_is_correct
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert guess.response == "Juneau"
    assert_equal "correct", guess.feedback
  end

  def test_the_response_is_incorrect
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("J", card)
    assert guess.response == "J"
    assert_equal "incorrect", guess.feedback
  end


end
