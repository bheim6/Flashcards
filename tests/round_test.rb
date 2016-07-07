gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require './lib/guess'
require './lib/round'


class RoundTest < Minitest::Test




  def test_it_has_a_deck
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal deck, round.deck
  end

  def test_it_has_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal [], round.guesses
  end

  def test_what_is_current_card
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal card_1, round.current_card
  end

  # def test_it_records_guesses
  #   card_1 = Card.new("What is the capital of Alaska?", "Juneau")
  #   card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
  #   deck = Deck.new([card_1, card_2])
  #   round = Round.new(deck)
  #   guess = Guess.new("Juneau", round.current_card)
  #   assert_equal guess, round.record_guess("Juneau")
  # end

  def test_it_counts_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    guess = Guess.new("Juneau", round.current_card)
    round.record_guess("Juneau", card_1)
    assert_equal 1, round.guesses.count
  end

  def test_it_gives_feedback
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    guess = Guess.new("Juneau", round.current_card)
    round.record_guess("Juneau", card_1)
    assert_equal "Correct!", round.guesses.first.feedback
  end

  def test_it_counts_correct_responses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    guess = Guess.new("Juneau", round.current_card)
    round.record_guess("Juneau", card_1)
    assert_equal 1, round.number_correct
  end

  def test_it_advances_a_card
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    guess = Guess.new("Juneau", round.current_card)
    round.record_guess("Juneau", card_1)
    round.guesses.first.feedback
    assert_equal card_2, round.current_card

    round.record_guess("3", card_2)
    assert_equal 2, round.guesses.count
    assert_equal "Incorrect", round.guesses.last.feedback
  end

  def test_it_records_number_correct
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    guess = Guess.new("Juneau", round.current_card)
    round.record_guess("Juneau", card_1)
    round.guesses.first.feedback
    round.record_guess("3", card_2)

    assert_equal 1, round.number_correct
  end

  def test_it_records_score
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    guess = Guess.new("Juneau", round.current_card)
    round.record_guess("Juneau", card_1)
    round.guesses.first.feedback
    round.record_guess("3", card_2)

    assert_equal 50, round.percent_correct
  end










end
