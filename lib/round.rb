require_relative 'guess'


class Round
  attr_reader :deck, :guesses, :response, :card, :round_count

  def initialize(deck)
    @deck = deck
    @guesses = []
    @guess = []
    @round_count = 0
  end

  def current_card
    @deck.cards[round_count]
  end

  def record_guess(response, card)
    @guesses << Guess.new(response, current_card)
    @round_count += 1
  end

  def number_correct
    number_correct = @guesses.find_all do |guess|
      guess.correct?
    end
    number_correct.count
  end

  def percent_correct
    number_correct.to_f / deck.count * 100
  end

  def start
    puts "Welcome! You're playing with #{deck.count} cards."
    puts "-------------------------------------------------"

    puts "This is card number #{@round_count + 1} out of #{deck.count}."
    puts "Question: #{current_card.question}"
    guess = gets.chomp
    record_guess(guess, current_card)
    puts @guesses.first.feedback

    puts "This is card number #{@round_count + 1} out of #{deck.count}."
    puts "Question: #{current_card.question}"
    guess = gets.chomp
    record_guess(guess, current_card)
    puts @guesses[1].feedback

    puts "This is card number #{@round_count + 1} out of #{deck.count}."
    puts "Question: #{current_card.question}"
    guess = gets.chomp
    record_guess(guess, current_card)
    puts @guesses[2].feedback

    puts "This is card number #{@round_count + 1} out of #{deck.count}."
    puts "Question: #{current_card.question}"
    guess = gets.chomp
    record_guess(guess, current_card)
    puts @guesses[3].feedback

    puts "****** Game over! ******"
    puts "You had #{number_correct} correct guesses out of #{deck.count} for a score of #{percent_correct.to_i}%."
  end


end
