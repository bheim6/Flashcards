class CardGenerator

    def initialize(file)
      @file = file
    end

    def cards
     file = File.read(@file)
     array = file.split("\n").map do |card|
       card.split(",")
     end

    cards = array.map do |line|
       Card.new(line[0], line[1])
     end
    #  require "pry" ; binding.pry
   end

end
