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

  def record_guess(guess)
    @guesses << Guess.new(response, card)
  end

end
