require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess'
require './lib/card'
require 'pry'

class CardTest < Minitest::Test
  def test_it_exists
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)

    assert_instance_of Guess, guess
  end

  def test_each_guess_has_a_card
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)

    assert_equal card, guess.card
  end

  def test_each_guess_has_a_response
    card_1 = Card.new("10", "Hearts")
    guess_1 = Guess.new("10 of Hearts", card_1)
    card_2 = Card.new("Queen", "Clubs")
    guess_2 = Guess.new("2 of Diamonds", card_2)

    assert_equal "10 of Hearts", guess_1.response
    assert_equal "2 of Diamonds", guess_2.response
  end

  def test_it_can_check_guess
    card_1 = Card.new("10", "Hearts")
    guess_1 = Guess.new("10 of Hearts", card_1)
    card_2 = Card.new("Queen", "Clubs")
    guess_2 = Guess.new("2 of Diamonds", card_2)

    assert guess_1.correct?
    refute guess_2.correct?
  end

  def test_feedback
    card_1 = Card.new("10", "Hearts")
    guess_1 = Guess.new("10 of Hearts", card_1)
    card_2 = Card.new("Queen", "Clubs")
    guess_2 = Guess.new("2 of Diamonds", card_2)

    assert_equal "Correct!", guess_1.feedback
    assert_equal "Incorrect.", guess_2.feedback
  end


end
