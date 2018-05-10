class Round
  attr_reader :deck,
              :guesses

  def initialize(deck)
    @deck = deck
    @guesses = []
    @current_card_index = 0
  end

  def current_card
    deck.cards[@current_card_index]
  end

  def record_guess(response)
    @guesses << Guess.new(response, current_card)
    next_card
  end

  def number_correct
    guesses.select do |guess|
      guess.correct?
    end.count
  end

  def next_card
    @current_card_index += 1
  end

  def percent_correct
    (number_correct.to_f / guesses.count) * 100
  end
end
