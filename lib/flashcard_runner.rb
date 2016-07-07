#Welcome to the Thunderdome

require_relative 'deck'
require_relative 'card'
require_relative 'guess'
require_relative 'round'

card_1 = Card.new("What is 5 + 5?", "10")
card_2 = Card.new("What is Rachel's favorite animal?", "red panda")
card_3 = Card.new("What is Mikes's middle name?", "nobody knows")
card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin bieber")

deck = Deck.new([card_1, card_2, card_3, card_4])

round = Round.new(deck)

round.start
