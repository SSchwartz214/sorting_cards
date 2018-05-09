require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/guess'
require './lib/deck'
require './lib/round'
require 'pry'

class DeckTest < Minitest::Test

  def test_each_round_has_a_deck
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_equal deck, round.deck
  end

  def test_it_can_store_guesses
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_equal [], round.guesses
  end

  def test_it_can_select_current_card
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_equal card_1, round.current_card
  end

  def test_it_can_record_guesses
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    guess = Guess.new("3 of Hearts", card_1)

    assert_equal "3 of Hearts", guess.response
  end

    def test_it_can_count_guesses
      card_1 = Card.new("3","Hearts")
      card_2 = Card.new("4", "Clubs")
      deck = Deck.new([card_1, card_2])
      round = Round.new(deck)

      round.record_guess("3 of Hearts")

      assert_equal 1, round.guesses.count
    end

    def test_it_can_retrive_feedback
      card_1 = Card.new("3","Hearts")
      card_2 = Card.new("4", "Clubs")
      deck = Deck.new([card_1, card_2])
      round = Round.new(deck)

      round.record_guess("3 of Hearts")

      assert_equal "Correct!", round.guesses.first.feedback
    end

    def test_it_can_count_number_correct
      card_1 = Card.new("3","Hearts")
      card_2 = Card.new("4", "Clubs")
      deck = Deck.new([card_1, card_2])
      round = Round.new(deck)

      round.record_guess("3 of Hearts")

      assert_equal 1, round.number_correct
    end

    def test_next_current_card
      card_1 = Card.new("3","Hearts")
      card_2 = Card.new("4", "Clubs")
      deck = Deck.new([card_1, card_2])
      round = Round.new(deck)

      round.record_guess("3 of Hearts")

      assert_equal card_2, round.current_card

    end

end


# round.current_card
# => #<Card:0x007ffdf1820a90 @value="4", @suit="Clubs">

# round.record_guess("Jack of Diamonds")
# => #<Guess:0x007ffdf19c8a00 @card=#<Card:0x007ffdf1820a90 @value="4", @suit="Clubs">, @response="Jack of Diamonds">

# round.guesses.count
# => 2

# round.guesses.last.feedback
# => "Incorrect."

# round.number_correct
# => 1

# round.percent_correct
# => 50
