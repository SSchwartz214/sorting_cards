class Deck
  attr_reader :cards

  def initialize(card_array)
    @cards = card_array
  end

  def count
    @cards.count
  end

  def sort
    n = cards.length
    loop do
      swapped = false
      (n-1).times do |i|
        if cards[i].numeric_value > cards[i + 1].numeric_value
          cards[i], cards[i + 1] = cards[i + 1], cards[i]
          swapped = true
        end
      end
      break if swapped == false
    end
    cards
  end
end
