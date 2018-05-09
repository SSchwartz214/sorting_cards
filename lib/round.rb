class Round
  attr_reader :deck,
              :guesses,
              :correct_guesses

  def initialize(deck)
    @deck = deck
    @guesses = []
    @current_card_index = 0
    @correct_guesses = 0
  end

  def current_card
    deck.cards[@current_card_index]
  end

  def record_guess(response)
    @guesses << Guess.new(response, current_card)
    @correct_guesses += 1 if @guesses.last.correct?
    next_card
  end

  def number_correct
    correct_guesses
  end

  def next_card
    @current_card_index += 1
  end

  def percent_correct
    (@correct_guesses.to_f / guesses.count) * 100
  end


end
